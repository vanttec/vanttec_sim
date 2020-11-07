#!/usr/bin/env python

import rospy
import keyboard 

#Import the type of message type
from std_msgs.msg import String
   
#-----------------------------Import from turtlebot3_telep_key
import rospy
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
Moving around:
    q = Torpedoes_1
    w = Torpedoes_2
    a = Shoot
    s = Stop

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
def talker():
    #Publica: topic named chatter, type String, 
    pub = rospy.Publisher('Shoot_Torpedo_1', Twist, queue_size=10)
    pub2 = rospy.Publisher('Shoot_Torpedo_2', Twist, queue_size=10)

    #Inicia el nodo
    rospy.init_node('Torpedoes', anonymous=True)

    #10 veces por segundo
    rate = rospy.Rate(10) 

    target_linear_vel = 0
    status = 0

    while not rospy.is_shutdown():
        key = getKey()
        if key=='a':
            target_linear_vel = 0.5
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

        if status == 20 :
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
        talker()
    except rospy.ROSInterruptException:
        pass
