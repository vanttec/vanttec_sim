#!/usr/bin/env python

import rospy
from vanttec_uuv.msg import ThrustControl
from geometry_msgs.msg import Wrench

thrust_pub = rospy.Publisher("/vtec_u3/thruster_manager/input", Wrench, queue_size=1000)

def remap_thrust(src_thrust):
    dest_thrust = Wrench()
    dest_thrust.force.x = float(src_thrust.tau_x)
    dest_thrust.force.y = float(src_thrust.tau_y)
    dest_thrust.force.z = float(src_thrust.tau_z + 104.4)
    dest_thrust.torque.x = 0.0
    dest_thrust.torque.y = 0.0
    dest_thrust.torque.z = float(src_thrust.tau_yaw)

    thrust_pub.publish(dest_thrust)
    
def main():
    rospy.init_node("remap_thrust", anonymous=0)
    rospy.Subscriber("/uuv_control/uuv_control_node/thrust", ThrustControl, remap_thrust)
    rospy.spin()

if __name__ == "__main__":
    main()