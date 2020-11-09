# vanttec/vanttec_uv_sim/aiming_system

This is the UV simulation repository made for testing the UV aiming system. It runs on Gazebo and requires the package uuv_simulator to be installed.

To install the repo just run `init_workspace.sh`

To run the UV simulator for Aiming System, in a terminal write the following command:

`roslaunch shooter_description shooter_gazebo.launch`

To run the node for shooting the torpedoes, in a terminal write the following command:

`rosrun shooter_description shoot.py`

To visualize the Intel Realsense Camera information in RViz, in a terminal write the following command:

`rviz` 
