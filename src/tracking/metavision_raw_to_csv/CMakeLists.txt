project(metavision_raw_to_csv)

cmake_minimum_required(VERSION 3.5)

set(CMAKE_CXX_STANDARD 14)

find_package(MetavisionSDK COMPONENTS core driver REQUIRED)
find_package(Boost COMPONENTS program_options REQUIRED)

set (sample metavision_raw_to_csv)
add_executable(${sample} ${sample}.cpp)
target_link_libraries(${sample} MetavisionSDK::core MetavisionSDK::driver Boost::program_options)
