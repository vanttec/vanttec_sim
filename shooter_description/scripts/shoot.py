#!/usr/bin/env python

import rospy
import keyboard 
from std_msgs.msg import String
from geometry_msgs.msg import Twist

import sys, select, os
if os.name == 'nt':
  import msvcrt
else:
  import tty, termios

target_linear_vel = 0.0
status = 0

msg = """
Shoot Torpedoes
---------------------------
1) Choose:
    a = Shoot
    s = Stop
2) Which torpedo?
    q = Torpedo 1
    w = Torpedo 2

CTRL-C to quit
"""

def getKey():
    if os.name == 'nt':
        return msvcrt.getch()

    tty.setraw(sys.stdin.fileno())
    rlist, _, _ = select.select([sys.stdin], [], [], 0.1)
    if rlist:
        key = sys.stdin.read(1)
    else:
        key = ''

    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key

#--------------------------------------------
def Shoot():
    #Publish: Two topics Twist message type 
    pub = rospy.Publisher('Shoot_Torpedo_1', Twist, queue_size=10)
    pub2 = rospy.Publisher('Shoot_Torpedo_2', Twist, queue_size=10)

    #Initiates node
    rospy.init_node('Torpedoes', anonymous=True)

    #10 Hz
    rate = rospy.Rate(10) 

    target_linear_vel = 0
    status = 0

    while not rospy.is_shutdown():
        key = getKey()
        if key=='a':
            target_linear_vel = 0.2
        elif key=='s':
            target_linear_vel = 0
        #This key is control+c for killing the terminal
        if (key == '\x03'):
            break
        rospy.loginfo(key)
        status = status + 1

        twist=Twist()
        
        twist.linear.x = 0.0 
        twist.linear.y = target_linear_vel
        twist.linear.z = 0.0  
        twist.angular.x = 0.0
        twist.angular.y = 0.0
        twist.angular.z = 0.0 

        if status == 10 :
            print (msg) 
            status = 0

        if key == 'q':
            pub.publish(twist)
        elif key == 'w': 
            pub2.publish(twist)
        rate.sleep()
   
if __name__ == '__main__':
    if os.name != 'nt':
        settings = termios.tcgetattr(sys.stdin)
    try:
        Shoot()
    except rospy.ROSInterruptException:
        pass
