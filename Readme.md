# VantTec UV simulation

This is the USV and UUV simulation repository. It runs on Gazebo and requires the package uuv_simulator to be installed.

To install the repo just run `init_workspace.sh`

To run the USV simulator, in a terminal write the following commands:

 ```
roslaunch uv_worlds lake.launch
roslaunch vtec_s3_description upload.launch
```