#!/bin/bash

cd
mkdir -p vanttec_uv_sim_ws/src
cd vanttec_uv_sim_ws/src
git clone _
git submodule update --init --recursive
cd /vanttec_uv_sim_ws
catkin_make
