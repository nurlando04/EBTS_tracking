execute_process(COMMAND "/home/nurlando/event_based_tactile/build/DynamixelSDK/ros/dynamixel_sdk/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/nurlando/event_based_tactile/build/DynamixelSDK/ros/dynamixel_sdk/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
