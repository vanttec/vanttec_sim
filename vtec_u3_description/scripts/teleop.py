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
1) Lineal:
    a = izquierda
    d = derecha
    w = enfrente
    s = atras 
2) Angular:
    i = r
    o = pitch
    p = yaw

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
    #Publish: one topic Twist message type 
    pub = rospy.Publisher('/teleop', Twist, queue_size=10)

    #Initiates node
    rospy.init_node('teleop_u3', anonymous=False)

    #10 Hz
    rate = rospy.Rate(10) 

    target_linear_vel = 0
    status = 0

    while not rospy.is_shutdown():
        
        twist=Twist()

        key = getKey()
        #enfrente
        if key=='a':
            enfrente = 0.8
            twist.linear.y = enfrente 
        #Right
        elif key=='d':
            atras = -0.8
            twist.linear.y = atras 
        #izquierda
        elif key=='w':
            enfrente = 0.8
            twist.linear.x = enfrente
        #atras
        elif key=='s':
            atras = -0.8
            twist.linear.x = atras 
        #z abajo
        elif key=='l':
            z_abajo = -1
            twist.linear.z = z_abajo
        #z arriba
        elif key=='k':
            z_arriba = 1
            twist.angular.y = z_arriba     
        #Raw
        elif key=='i':
            yaw_d = -1
            twist.angular.z = yaw_d
        #Yaw izquierda
        elif key=='o':
            yaw_i = 1
            twist.angular.z = yaw_i
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
        Shoot()
    except rospy.ROSInterruptException:
        pass
