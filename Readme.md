# VantTec UV simulation

This is the USV and UUV simulation repository. It runs on Gazebo and requires the package uuv_simulator to be installed.

To install the repo just run `init_workspace.sh`

To run the USV simulator, in a terminal write the following commands:

 ```
roslaunch uuv_gazebo_worlds lake.launch
roslaunch vtec_s3_description upload.launch
roslaunch vtec_s3_control start_thruster_manager.launch
rostopic pub /vtec_s3/thruster_manager/input ...
```

To run the UUV simulator, in a terminal write the following commands:

```
roslaunch uuv_gazebo_worlds lake.launch
roslaunch vtec_u3_description upload.launch
rostopic pub /uuv_desired_velocity ...
```
