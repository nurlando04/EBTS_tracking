/**********************************************************************************************************************
 * Copyright (c) Prophesee S.A. - All Rights Reserved                                                                 *
 *                                                                                                                    *
 * Subject to Prophesee Metavision Licensing Terms and Conditions ("License T&C's").                                  *
 * You may not use this file except in compliance with these License T&C's.                                           *
 * A copy of these License T&C's is located at docs.prophesee.ai/licensing and in the "LICENSE" file accompanying     *
 * this file.                                                                                                         *
 **********************************************************************************************************************/

// This code sample demonstrates how to use Metavision SDK Driver and Core (pipeline utility) to convert an event-based
// RAW file to a CSV formatted event-based file.
// It also shows how to customize an instance of BaseStage to write to a file.
// This can be an alternative to creating a class deriving from BaseStage, especially when the code is not particularly
// reusable.

#include <exception>
#include <iostream>
#include <fstream>
#include <functional>
#include <chrono>
#include <boost/program_options.hpp>
#include <metavision/sdk/base/utils/log.h>
#include <metavision/sdk/core/pipeline/pipeline.h>
#include <metavision/sdk/core/pipeline/stage.h>
#include <metavision/sdk/driver/camera_exception.h>
#include <metavision/sdk/driver/pipeline/camera_stage.h>

namespace po = boost::program_options;

int main(int argc, char *argv[]) {
    std::string in_raw_file_path;
    std::string name_of_csv;

    const std::string program_desc(
        "Code sample demonstrating how to use Metavision SDK Driver and Core to convert a RAW file to a CSV formatted"
        "file.\n");

    po::options_description options_desc("Options");
    // clang-format off
    options_desc.add_options()
        ("help,h", "Produce help message.")
        ("input-raw-file,i", po::value<std::string>(&in_raw_file_path)->required(), "Path to input RAW file.")
        ("name of csv,o", po::value<std::string>(&name_of_csv)->required(), "Path to input RAW file.")
        ;
    // clang-format on

    po::variables_map vm;
    try {
        po::store(po::command_line_parser(argc, argv).options(options_desc).run(), vm);
        if (vm.count("help")) {
            MV_LOG_INFO() << program_desc;
            MV_LOG_INFO() << options_desc;
            return 0;
        }
        po::notify(vm);
    } catch (po::error &e) {
        MV_LOG_ERROR() << program_desc;
        MV_LOG_ERROR() << options_desc;
        MV_LOG_ERROR() << "Parsing error:" << e.what();
        return 1;
    }

    // A pipeline for which all added stages will automatically be run in their own processing threads (if applicable)
    Metavision::Pipeline p(true);

    /// Pipeline
    //
    //  0 (Camera) -->-- 1 (Csv writer)
    //

    // 0) Construct a camera from a recording, reading the data as fast as possible
    Metavision::Camera cam;
    
    try {
        cam=Metavision::Camera::from_file(in_raw_file_path);
        //cam = Metavision::Camera::from_first_available(); //from_file(in_raw_file_path, false);
    } catch (Metavision::CameraException &e) {
        MV_LOG_ERROR() << e.what();
        return 1;
    }


    
    //cam.biases().set_from_file("");
    //cam.roi().set({200, 300, 440, 10}); //minimum height and width is 10x10
    auto &cam_stage = p.add_stage(std::make_unique<Metavision::CameraStage>(std::move(cam)));

    // 1) Construct a stage instance that will be customized to write the data in a CSV formatted file
    std::unique_ptr<Metavision::Stage> csv_stage_ptr = std::make_unique<Metavision::Stage>();
    std::string filename(name_of_csv);
    std::ofstream ofs(filename);
    if (!ofs.is_open()) {
        MV_LOG_ERROR() << "Unable to write in" << filename;
        return 1;
    }

    // Set the consuming callback of the stage to actually write the data produced by the camera stage
    std::string lines;
    csv_stage_ptr->set_consuming_callback([&lines, &ofs](const boost::any &data) {
        try {
            auto buffer = boost::any_cast<Metavision::Stage::EventBufferPtr>(data);
            for (auto &event : *buffer) {
                ofs << event.x << "," << event.y << "," << event.p << "," << event.t << "\n";
            }
        } catch (boost::bad_any_cast &) {
            MV_LOG_WARNING() << Metavision::Log::function << "Wrong type of data passed to consuming callback !";
        }
    });

    // Add the stage to the pipeline
    p.add_stage(std::move(csv_stage_ptr), cam_stage);

    using namespace std::chrono_literals;
    auto log = MV_LOG_INFO("") << Metavision::Log::no_endline << Metavision::Log::no_space << "Writing CSV file"
                               << std::flush;
    int dots       = 0;
    auto last_time = std::chrono::high_resolution_clock::now();

    // Run the pipeline step by step to give a visual feedback about the progression
    while (p.step()) {
        const auto time = std::chrono::high_resolution_clock::now();
        if (std::chrono::duration_cast<std::chrono::microseconds>(time - last_time) > 10us) {
            last_time = time;
            dots      = (dots + 1) % 4;
            log << "\r                         ";
            log << "\rWriting CSV file" << std::string("...").substr(0, dots);
            log << std::flush;
        }
    }
    log << "\r                         ";
    log << "\rWrote CSV file " << filename << std::endl;

    return 0;
}
