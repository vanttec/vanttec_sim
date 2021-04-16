#!/usr/bin/env python

import rospy
import keyboard 
from geometry_msgs.msg import Twist
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2

import sys, select, os
if os.name == 'nt':
    import msvcrt
else:
    import tty, termios

counter = 0

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

def opencv_bridge(data, key):
    bridge = CvBridge()
    cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
    cv2.imshow("Image window", cv_image)
    if cv2.waitKey(10) & (key == 'p'):
        global counter
        counter +=1
        cv2.imwrite('/home/ivan5d/Pictures/path_marker2/foto_' +str(counter) + '.bmp', cv_image)

#--------------------------------------------
#Publisher
def callback(data):
    v_lin = 0.8
    v_ang = 0.8
    twist=Twist() 
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
    rate = rospy.Rate(10)
    pub.publish(twist)
    rate.sleep()
    opencv_bridge(data, key)    

def image_subscriber():
     #/frontr200/camera/color/image_raw [sensor_msgs/Image]
    rospy.init_node('Teleop', anonymous=True)
    rospy.Subscriber("/frontr200/camera/color/image_raw", Image, callback) #Callback
    rospy.spin()

if __name__ == '__main__':
    if os.name != 'nt':
        settings = termios.tcgetattr(sys.stdin)
    try:
        image_subscriber()
    except rospy.ROSInterruptException:
        pass