#!/usr/bin/env python

import rospy
# from vanttec_uuv.msg import ThrustControl
from geometry_msgs.msg import Twist

thrust_pub = rospy.Publisher("/uuv_desired_velocity", Twist, queue_size=1000)

def remap_vel(src_vel):
    des_vel = Twist()
    des_vel.linear.x = src_vel.linear.x
    des_vel.linear.y = -src_vel.linear.y
    des_vel.linear.z = -src_vel.linear.z
    des_vel.angular.x = 0.0
    des_vel.angular.y = 0.0
    des_vel.angular.z = -src_vel.angular.z

    thrust_pub.publish(des_vel)
    
def main():
    rospy.init_node("remap_thrust", anonymous=0)
    rospy.Subscriber("/uuv_simulation/dynamic_model/vel", Twist, remap_vel)
    rospy.spin()

if __name__ == "__main__":
    main()