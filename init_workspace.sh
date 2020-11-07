#!/bin/bash

cd
mkdir vanttec_uv_sim_ws/
cd vanttec_uv_sim_ws/
mkdir src/
mv ~/vanttec_uv_sim ~/vanttec_uv_sim_ws/src
cd /src
git submodule update --init --recursive
cd /vanttec_uv_sim_ws
catkin_make
