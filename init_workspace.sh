#!/bin/bash

cd
mkdir -p vanttec_uv_sim_ws/src
mv vanttec_uv_sim vanttec_uv_sim_ws/src
cd vanttec_uv_sim_ws/src
git submodule update --init --recursive
cd /vanttec_uv_sim_ws
catkin_make
