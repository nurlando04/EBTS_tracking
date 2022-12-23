# Install script for directory: /home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/nurlando/event_based_tactile/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_workbench_msgs/msg" TYPE FILE FILES
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/AX.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/EX.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/MX.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/MX2.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/MX2Ext.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/MXExt.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/PRO.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/PROExt.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/RX.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/XH.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/XL.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/XL320.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/XM.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/XMExt.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/DynamixelState.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/DynamixelStateList.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/DynamixelInfo.msg"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/msg/DynamixelLoadInfo.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_workbench_msgs/srv" TYPE FILE FILES
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/srv/GetDynamixelInfo.srv"
    "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/srv/DynamixelCommand.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_workbench_msgs/cmake" TYPE FILE FILES "/home/nurlando/event_based_tactile/build/dynamixel-workbench-msgs/dynamixel_workbench_msgs/catkin_generated/installspace/dynamixel_workbench_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/nurlando/event_based_tactile/devel/include/dynamixel_workbench_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/nurlando/event_based_tactile/devel/share/roseus/ros/dynamixel_workbench_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/nurlando/event_based_tactile/devel/share/common-lisp/ros/dynamixel_workbench_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/nurlando/event_based_tactile/devel/share/gennodejs/ros/dynamixel_workbench_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/nurlando/event_based_tactile/devel/lib/python2.7/dist-packages/dynamixel_workbench_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/nurlando/event_based_tactile/devel/lib/python2.7/dist-packages/dynamixel_workbench_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/nurlando/event_based_tactile/build/dynamixel-workbench-msgs/dynamixel_workbench_msgs/catkin_generated/installspace/dynamixel_workbench_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_workbench_msgs/cmake" TYPE FILE FILES "/home/nurlando/event_based_tactile/build/dynamixel-workbench-msgs/dynamixel_workbench_msgs/catkin_generated/installspace/dynamixel_workbench_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_workbench_msgs/cmake" TYPE FILE FILES
    "/home/nurlando/event_based_tactile/build/dynamixel-workbench-msgs/dynamixel_workbench_msgs/catkin_generated/installspace/dynamixel_workbench_msgsConfig.cmake"
    "/home/nurlando/event_based_tactile/build/dynamixel-workbench-msgs/dynamixel_workbench_msgs/catkin_generated/installspace/dynamixel_workbench_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_workbench_msgs" TYPE FILE FILES "/home/nurlando/event_based_tactile/src/dynamixel-workbench-msgs/dynamixel_workbench_msgs/package.xml")
endif()

