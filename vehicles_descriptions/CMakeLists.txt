cmake_minimum_required(VERSION 3.0.2)
project(vehicles_descriptions)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)


find_package(catkin REQUIRED COMPONENTS geometry_msgs nav_msgs genmsg)
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

## Declare a C++ library
# add_library(${PROJECT_NAME}
#   src/${PROJECT_NAME}/shooter_description.cpp
# )

add_library(SixDOFMov
            lib/mobility/include/SixDOFMov.hpp
            lib/mobility/src/SixDOFMov.cpp)
target_link_libraries(SixDOFMov ${GAZEBO_LIBRARIES})

#############
## Install ##
#############

#############
## Testing ##
#############