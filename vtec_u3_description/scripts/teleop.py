#!/usr/bin/env python

import rospy
import keyboard 
from geometry_msgs.msg import Twist
from sensor_msgs.msg import Image

import sys, select, os
if os.name == 'nt':
    import msvcrt
else:
    import tty, termios

status = 0

#Diagrama general: camera ---> callback --[if]--> teleop 
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
#Publisher
def callback(data):
    v_lin = 0.8
    v_ang = 0.8
    twist=Twist()
    image = Image() 
    msg = """

    ---------------------------
    Teleop vtec_u3 

    1) Lineal:
        a = left
        d = rights
        w = forwards
        s = backwards
    2) Angular:
        i = right yaw 
        o = left yaw
    3) Picture: 
        p = take picture

    CTRL-C to quit

    """
    key = getKey()
    #Forwards
    if key=='a':
        twist.linear.y = v_lin 
    #Right
    elif key=='d':
        twist.linear.y = -1*v_lin 
    #Left
    elif key=='w':
        twist.linear.x = v_lin
    #Backwards
    elif key=='s':
        twist.linear.x = -1*v_lin 
    #z down
    elif key=='l':
        twist.linear.z = -1*v_ang
    #z up
    elif key=='k':
        twist.angular.y = v_ang     
    #Right yaw
    elif key=='i':
        twist.angular.z = v_ang
    #Left yaw 
    elif key=='o':
        twist.angular.z = -1*v_ang
    print (msg)
    pub = rospy.Publisher('/teleop', Twist, queue_size=10)
    rate = rospy.Rate(5)
    pub.publish(twist)
    rate.sleep()

def Image_Subscriber():
     #/frontr200/camera/color/image_raw [sensor_msgs/Image]
    rospy.init_node('Teleop', anonymous=True)
    rospy.Subscriber("/frontr200/camera/color/image_raw", Image, callback) #Callback
    rospy.spin()

if __name__ == '__main__':
    if os.name != 'nt':
        settings = termios.tcgetattr(sys.stdin)
    try:
        Image_Subscriber()
    except rospy.ROSInterruptException:
        pass
