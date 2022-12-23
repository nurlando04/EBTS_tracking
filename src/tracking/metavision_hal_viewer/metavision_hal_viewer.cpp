/**********************************************************************************************************************
 * Copyright (c) Prophesee S.A. - All Rights Reserved                                                                 *
 *                                                                                                                    *
 * Subject to Prophesee Metavision Licensing Terms and Conditions ("License T&C's").                                  *
 * You may not use this file except in compliance with these License T&C's.                                           *
 * A copy of these License T&C's is located at docs.prophesee.ai/licensing and in the "LICENSE" file accompanying     *
 * this file.                                                                                                         *
 **********************************************************************************************************************/

#include <exception>
#include <iostream>
#include <boost/program_options.hpp>
#include <type_traits>
#include <chrono>
#include <opencv2/opencv.hpp>
#include <thread>
#include <mutex>

#include <metavision/hal/utils/hal_exception.h>
#include <metavision/hal/facilities/i_trigger_in.h>
#include <metavision/hal/facilities/i_trigger_out.h>
#include <metavision/hal/facilities/i_ll_biases.h>
#include <metavision/hal/facilities/i_monitoring.h>
#include <metavision/hal/facilities/i_event_rate_noise_filter_module.h>
#include <metavision/hal/facilities/i_device_control.h>
#include <metavision/hal/facilities/i_geometry.h>
#include <metavision/hal/facilities/i_decoder.h>
#include <metavision/hal/facilities/i_event_decoder.h>
#include <metavision/hal/facilities/i_roi.h>
#include <metavision/hal/device/device.h>
#include <metavision/hal/device/device_discovery.h>
#include <metavision/hal/device/device_roi.h>
#include <metavision/hal/facilities/i_events_stream.h>
#include <metavision/sdk/base/events/event_cd.h>
#include <metavision/sdk/base/events/event_ext_trigger.h>

class EventAnalyzer {
public:
    cv::Mat img, img_swap;

    std::mutex m;

    // Display colors
    cv::Vec3b color_bg  = cv::Vec3b(52, 37, 30);
    cv::Vec3b color_on  = cv::Vec3b(236, 223, 216);
    cv::Vec3b color_off = cv::Vec3b(201, 126, 64);

    void setup_display(const int width, const int height) {
        img      = cv::Mat(height, width, CV_8UC3);
        img_swap = cv::Mat(height, width, CV_8UC3);
        img.setTo(color_bg);
    }

    // Called from main Thread
    void get_display_frame(cv::Mat &display) {
        // Swap images
        {
            std::unique_lock<std::mutex> lock(m);
            std::swap(img, img_swap);
            img.setTo(color_bg);
        }
        img_swap.copyTo(display);
    }

    // Called from decoding Thread
    void process_events(const Metavision::EventCD *begin, const Metavision::EventCD *end) {
        // acquire lock
        {
            std::unique_lock<std::mutex> lock(m);
            for (auto it = begin; it != end; ++it) {
                img.at<cv::Vec3b>(it->y, it->x) = (it->p) ? color_on : color_off;
            }
        }
    }
};

namespace po = boost::program_options;
int main(int argc, char *argv[]) {
    std::string in_raw_file_path;
    std::string out_raw_file_path;
    std::string serial;
    int illumination = 0;
    int temperature  = 0;

    const std::string program_desc("Sample code that demonstrates how to use Metavision HAL to visualize events.\n");

    po::options_description options_desc("Options");
    // clang-format off
    options_desc.add_options()
            ("help,h", "Produce help message.")
            ("input-raw-file,i",  po::value<std::string>(&in_raw_file_path), "Path to input RAW file. If not specified, the camera live stream is used.")
            ("output-raw-file,o", po::value<std::string>(&out_raw_file_path), "Path to output RAW file.")
            ("serial,s",          po::value<std::string>(&serial), "Serial of the camera.")
            ;
    // clang-format on

    po::variables_map vm;
    try {
        po::store(po::command_line_parser(argc, argv).options(options_desc).run(), vm);
        po::notify(vm);
    } catch (po::error &e) {
        std::cerr << program_desc << std::endl;
        std::cerr << options_desc << std::endl;
        std::cerr << "Parsing error: " << e.what() << std::endl;
        return 1;
    }

    if (vm.count("help")) {
        std::cout << program_desc << std::endl;
        std::cout << options_desc << std::endl;
        return 0;
    }

    // Open the device
    std::cout << "Opening camera..." << std::endl;
    std::unique_ptr<Metavision::Device> device;
    try {
        if (in_raw_file_path.empty()) {
            device.reset(Metavision::DeviceDiscovery::open(serial));
        } else {
            device.reset(Metavision::DeviceDiscovery::open_raw_file(in_raw_file_path));
        }
    } catch (Metavision::HalException &e) { std::cout << "Error exception: " << e.what() << std::endl; }

    if (!device) {
        std::cerr << "Camera opening failed." << std::endl;
        return 1;
    }
    std::cout << "Camera open." << std::endl;


    Metavision::DeviceRoi roi=Metavision::DeviceRoi(330,220,1,1);
    device->get_facility<Metavision::I_ROI>()->set_ROI(roi);
    device->get_facility<Metavision::I_ROI>()->enable(true);

    /// [RawfileCreation]
    Metavision::I_EventsStream *i_eventsstream = device->get_facility<Metavision::I_EventsStream>();
    if (i_eventsstream) {
        if (out_raw_file_path != "") {
            i_eventsstream->log_raw_data(out_raw_file_path);
        }
    } else {
        std::cerr << "Could not initialize events stream." << std::endl;
        return 3;
    }
    /// [RawfileCreation]

    if (in_raw_file_path.empty()) {
        Metavision::I_DeviceControl *i_device_control = device->get_facility<Metavision::I_DeviceControl>();
        i_device_control->start();
        std::cout << "Camera started." << std::endl;
    }

    /// [triggers]
    // Enable internal trigger loopback for trigger testing purposes.
    // When enabling trigger out (pin 0/TRIGGER_OUT), the signal is also duplicated on trigger channel 6
    Metavision::I_TriggerOut *i_trigger_out = device->get_facility<Metavision::I_TriggerOut>();
    Metavision::I_TriggerIn *i_trigger_in   = device->get_facility<Metavision::I_TriggerIn>();
    if (i_trigger_in && i_trigger_out) {
        i_trigger_out->set_period(1000); //TODO: CHECK WHAT IS HAPPENNING HERE
        i_trigger_out->set_duty_cycle(0.05); 
        i_trigger_out->enable();
        i_trigger_in->enable(6);
    }
    /// [triggers]

    /// [geometry]
    Metavision::I_Geometry *i_geometry = device->get_facility<Metavision::I_Geometry>();
    if (!i_geometry) {
        std::cerr << "Could not retrieve geometry." << std::endl;
        return 4;
    }
    /// [geometry]

    // Instantiate framer object
    EventAnalyzer event_analyzer;
    event_analyzer.setup_display(i_geometry->get_width(), i_geometry->get_height());

    /// [sign-up cd callback]
    // Get the handler of CD events
    Metavision::I_EventDecoder<Metavision::EventCD> *i_tddecoder =
        device->get_facility<Metavision::I_EventDecoder<Metavision::EventCD>>();

    if  (i_tddecoder) {
        // Register a lambda function to be called on every CD events
        i_tddecoder->set_add_decoded_vevent_callback(
                    [&event_analyzer](const Metavision::EventCD *begin, const Metavision::EventCD *end) {
            event_analyzer.process_events(begin, end);
        });
    }
    /// [sign-up cd callback]

    Metavision::I_EventDecoder<Metavision::EventExtTrigger> *i_triggerdecoder =
        device->get_facility<Metavision::I_EventDecoder<Metavision::EventExtTrigger>>();
    if (i_triggerdecoder) {
        i_triggerdecoder->set_add_decoded_event_callback([&](const Metavision::EventExtTrigger &ev) {
            std::cout << "Trigger "
                      << " " << ev.t << " " << ev.id << " " << ev.p << std::endl;
        });
    } else {
        std::cout << "No trigger decoder." << std::endl;
    }

    Metavision::I_Monitoring *i_monitoring = device->get_facility<Metavision::I_Monitoring>();

    /// [biases]
    // Reading biases from the @ref Metavision::I_LL_Biases facility
    int intarr[]={299,244,377,1386,1260,1258,1500};
    const std::string stringarr[] = {"bias_diff","bias_diff_off","bias_diff_on","bias_fo","bias_hpf","bias_pr","bias_refr"};
    Metavision::I_LL_Biases *i_ll_biases = device->get_facility<Metavision::I_LL_Biases>();

    for(int i=0;i<7;i++){
        // device->get_facility<Metavision::I_LL_Biases>()->set(stringarr[i],intarr[i]);
        i_ll_biases->set(stringarr[i],intarr[i]);
    }

    
    
    // check biases
    if (i_ll_biases) {
        auto biases_to_check = i_ll_biases->get_all_biases();
        for (auto &b : biases_to_check) {
            auto v = i_ll_biases->get(b.first);
            std::cout << "Initial value: " << b.first << v << std::endl;
        }
    }
    /// [biases]

    Metavision::I_EventRateNoiseFilterModule *i_event_rate_noise_filter_module =
        device->get_facility<Metavision::I_EventRateNoiseFilterModule>();
    if (i_event_rate_noise_filter_module) {
        std::cout << "Event rate noise filter: streaming from "
                  << i_event_rate_noise_filter_module->get_event_rate_threshold() << "Kev/s" << std::endl;
    }

    // Get the decoder of events & start decoding thread
    Metavision::I_Decoder *i_decoder = device->get_facility<Metavision::I_Decoder>();
    bool stop_decoding               = false;
    bool stop_application            = false;
    i_eventsstream->start();


    std::thread decoding_loop([&]() {
        using namespace std::chrono;
        milliseconds last_update = duration_cast<milliseconds>(system_clock::now().time_since_epoch());
        while (!stop_decoding) {
            short ret = i_eventsstream->poll_buffer();
            if (ret < 0) {
                std::cout << "End of file" << std::endl;
                i_eventsstream->stop();
                i_eventsstream->stop_log_raw_data();
                stop_decoding    = true;
                stop_application = true;
            } else if (ret == 0) {
                milliseconds current_time = duration_cast<milliseconds>(system_clock::now().time_since_epoch());
                if ((current_time - last_update).count() > 1000) {
                    last_update = current_time;
                    i_eventsstream->stop();
                    temperature  = i_monitoring->get_temperature();
                    illumination = i_monitoring->get_illumination();
                    i_eventsstream->start();
                }
                continue; 
            }

            /// [buffer]
            // Here we polled data, so we can launch decoding
            long n_bytes;
            uint8_t *raw_data = i_eventsstream->get_latest_raw_data(n_bytes);

            // This will trigger callbacks set on decoders: in our case EventAnalyzer.process_events
            i_decoder->decode(raw_data, raw_data + n_bytes);
            /// [buffer]
        }
    });

    // Prepare OpenCV window
    int fps         = 25;               // event-cameras do not have a frame rate, but we need one for visualization
    float wait_time = 1.0 / fps * 1000; // how much we should wait between two frames
    cv::Mat display;                    // frame where events will be accumulated
    std::string window_name = "Metavision HAL Viewer";
    cv::namedWindow(window_name, cv::WINDOW_GUI_EXPANDED);
    cv::resizeWindow(window_name, i_geometry->get_width(), i_geometry->get_height());

    // Now let's create the loop of main thread
    unsigned long frame = 0;
    while (!stop_application) {
        event_analyzer.get_display_frame(display);

        if (!display.empty()) {
            cv::imshow(window_name, display);
        }
        if (frame % 25 == 0) {
            std::cout << "Temp: " << temperature << std::endl;
            std::cout << "Illu: " << illumination << std::endl;
        }

        // If user presses `q` key, exit loop and stop application
        // if the user presses the `q` key, quit the loop
        int key = cv::waitKey(wait_time);
        if ((key & 0xff) == 'q') {
            stop_application = true;
            stop_decoding    = true;
            std::cout << "q pressed, exiting." << std::endl;
        }
        frame++;
    }

    // Wait end of decoding loop
    decoding_loop.join();

    return 0;
}
