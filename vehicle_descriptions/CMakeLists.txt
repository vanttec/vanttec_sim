cmake_minimum_required(VERSION 3.0.2)
project(vehicle_descriptions)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)


find_package(catkin REQUIRED COMPONENTS
      geometry_msgs
      nav_msgs
      genmsg
      tf2
      tf2_ros
      tf2_geometry_msgs
      gazebo_msgs
      vanttec_msgs
)
find_package(gazebo REQUIRED)

# find_package(catkin REQUIRED COMPONENTS)  

generate_messages(
   DEPENDENCIES
   geometry_msgs
   nav_msgs
)

catkin_package()

###########
## Build ##
###########

include_directories(
 include
 ${catkin_INCLUDE_DIRS}
)

include_directories(${GAZEBO_INCLUDE_DIRS})
link_directories(${GAZEBO_LIBRARY_DIRS})
list(APPEND CMAKE_CXX_FLAGS "${GAZEBO_CXX_FLAGS}")

add_executable(gazebo_interface lib/mobility/src/gazebo_interface.cpp)
add_executable(gazebo_interface_usv lib/mobility/src/gazebo_interface_usv.cpp)
add_executable(gazebo_interface_uuv lib/mobility/src/gazebo_interface_uuv.cpp)
target_link_libraries(gazebo_interface ${catkin_LIBRARIES})
target_link_libraries(gazebo_interface_usv ${catkin_LIBRARIES})
target_link_libraries(gazebo_interface_uuv ${catkin_LIBRARIES})

## Declare a C++ library
# add_library(${PROJECT_NAME}
#   src/${PROJECT_NAME}/shooter_description.cpp
# )

#add_library(SixDOFMov
#            lib/mobility/include/SixDOFMov.hpp
#            lib/mobility/src/SixDOFMov.cpp)
#target_link_libraries(SixDOFMov ${GAZEBO_LIBRARIES})

#############
## Install ##
#############

#############
## Testing ##
#############