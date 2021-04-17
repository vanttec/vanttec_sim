<<<<<<< HEAD
# VantTec UV simulation

This is the USV and UUV simulation repository. It runs on Gazebo and requires the package uuv_simulator to be installed.

To install the repo just run `init_workspace.sh`

To run the USV simulator, in a terminal write the following commands:

 ```
roslaunch uv_worlds lake.launch
roslaunch vtec_s3_description upload.launch
roslaunch usv_master usv_master.launch
```

To run the UUV simulator, in a terminal write the following commands:

```
roslaunch uv_worlds lake.launch
roslaunch vtec_u3_description upload.launch
run uuv simulation file from vanttec_uuv package
```

# Escenario tasks

- **Tasks2020** 
<p align="center">
  <img src="https://github.com/vanttec/vanttec_uv_sim/blob/feature/testmissions/sim_challenges/scene.jpeg" width="600" height="440" align="center"/>

</p>
=======
# vanttec/vanttec_uv_sim/aiming_system

This is the UV simulation repository made for testing the UV aiming system. It runs on Gazebo and requires the package uuv_simulator to be installed.

To install the repo just run `init_workspace.sh`

To run the UV simulator for Aiming System, in a terminal write the following command:

`roslaunch shooter_description shooter_gazebo.launch`

To run the node for shooting the torpedoes, in a terminal write the following command:

`rosrun shooter_description shoot.py`

To visualize the Intel Realsense Camera information in RViz, in a terminal write the following command:

`rviz` 
>>>>>>> feature/vtec_u3_torpedoes
