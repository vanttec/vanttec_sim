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

status = 0

msg = """

Teleop vtec_u3 
---------------------------
1) Lineal:
    a = izquierda
    d = derecha
    w = enfrente
    s = atras 
2) Angular:
    i = yaw derecho
    o = yaw izquierdo
3) Picture: 
    p = take picture

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
def Teleop():
    #Publish: one topic Twist message type 
    pub = rospy.Publisher('/teleop', Twist, queue_size=10)

    #Initiates node
    rospy.init_node('teleop_u3', anonymous=False)

    #10 Hz
    rate = rospy.Rate(10) 
    v_lin = 0.8
    v_ang = 0.8
    status = 0

    while not rospy.is_shutdown():
        
        twist=Twist()

        key = getKey()
        #enfrente
        if key=='a':
            twist.linear.y = v_lin 
        #Right
        elif key=='d':
            twist.linear.y = -1*v_lin 
        #izquierda
        elif key=='w':
            twist.linear.x = v_lin
        #atras
        elif key=='s':
            twist.linear.x = -1*v_lin 
        #z abajo
        elif key=='l':
            twist.linear.z = -1*v_ang
        #z arriba
        elif key=='k':
            twist.angular.y = v_ang     
        #Raw
        elif key=='i':
            twist.angular.z = v_ang
        #Yaw izquierda
        elif key=='o':
            twist.angular.z = -1*v_ang
        #This key is control+c for killing the terminal
        if (key == '\x03'):
            break
        rospy.loginfo(key)
        status = status + 1
        
        if status == 20 :
            print (msg) 
            status = 0

        pub.publish(twist)
        rate.sleep()
   
if __name__ == '__main__':
    if os.name != 'nt':
        settings = termios.tcgetattr(sys.stdin)
    try:
        Teleop()
    except rospy.ROSInterruptException:
        pass
