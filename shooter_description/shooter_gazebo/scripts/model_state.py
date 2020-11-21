#! /usr/bin/env python

import rospy
from gazebo_msgs.msg import ModelState

#Este debe ser publisher y el modelo tener un plugin, es decir convertirse en receptor

def Model_State():
    pub = rospy.Publisher("Pose_Torpedo_1", ModelState, ) 
