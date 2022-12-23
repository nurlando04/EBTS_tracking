project(metavision_hal_viewer_sample)
cmake_minimum_required(VERSION 3.5)

set(CMAKE_CXX_STANDARD 14)
set(THREADS_PREFER_PTHREAD_FLAG ON)

find_package(MetavisionHAL REQUIRED)
find_package(Boost COMPONENTS program_options REQUIRED)
find_package(OpenCV COMPONENTS core highgui REQUIRED)
find_package(Threads REQUIRED)

add_executable(metavision_hal_viewer metavision_hal_viewer.cpp)

target_link_libraries(metavision_hal_viewer PRIVATE Metavision::HAL_discovery Boost::program_options ${OpenCV_LIBS} Threads::Threads)
