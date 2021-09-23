#!/bin/bash

cd
mkdir vanttec_uv_sim_ws
mv vanttec_uv_sim vanttec_uv_sim_ws/src
cd vanttec_uv_sim_ws/src
git submodule update --init --recursive
cd 
cd vanttec_uv_sim_ws
catkin_make
export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:~/vanttec_uv_sim_ws/build
