# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;sensor_msgs;image_transport;prophesee_event_msgs;cv_bridge".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lprophesee_ros_driver".split(';') if "-lprophesee_ros_driver" != "" else []
PROJECT_NAME = "prophesee_ros_driver"
PROJECT_SPACE_DIR = "/home/nurlando/event_based_tactile/install"
PROJECT_VERSION = "0.0.2"
