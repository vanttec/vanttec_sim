#!/usr/bin/env python

#Nodo Mendivil (Punto 3D) -> /topico -> Nodo_Subscriber, y luego con el callback dentro de el se 
#activa el Publisher y seria: Nodo_Publisher -> /gazebo/set_model_state
#Y se publica y ya Gazebo jala esa informacion solito
#En el mismo script estaria el subscriber y el publisher.

"""
rostopic pub -1 /gazebo/set_model_state gazebo_msgs/ModelState "model_name: 'table'
pose:
  position:
    x: 0.0
    y: 0.0
    z: 0.0
"

"""

import rospy 
from gazebo_msgs.msg import ModelState
from geometry_msgs.msg import Pose
from std_msgs.msg import String 

"""
def Publisher(): #Pose

    #Publish: (topic_name, message type ModelState)
    pose_publisher = rospy.Publisher("/gazebo/set_model_state", ModelState, queue_size=10)
    
    #Initiates node 
    rospy.init_node("Pose_Torpedoes", anonymous=False)

    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        #Inherits ModelState class
        model_state = ModelState()
        #ModelState.Pose.Point.x,y or z
        model_state.model_name = "torpedoes_1"
        model_state.pose.position.x = 1.0
        model_state.pose.position.y = 1.0
        model_state.pose.position.z = 0.0
        pose_publisher.publish(model_state)
        rate.sleep()
"""

class Model_Pose:
    def __init__(self):
        self.value = 0
        rospy.init_node ("Pose_Models")

        self.pub = rospy.Publisher('topico_a_gazebo', String, queue_size= 10, latch=True)
        
        rospy.Subscriber('/topico_de_Mendivil', String, self.update_value)

    def update_value(self, msg):
        self.value = msg.data 
    
    def run (self):
        r = rospy.Rate(10)
        while not rospy.is_shutdown():
            self.pub.publish(self.value)
            print self.value
            r.sleep()
    
if __name__ == '__main__': 
    pose = Model_Pose()
    pose.run()

"""
#Whenever a message is published on the topic, a function callback will be called
def Pose_node():
    rospy.Subscriber("/Mendivil", String, Callback)
    
    rospy.init_node("Subscriber", anonymous= False)

    #Inherits String class 
    string = String()
    string.data = 'RECIBIENDO'
    rospy.spin

def Callback(msg):
    #Publish: (topic_name, message type ModelState)
    pose_publisher = rospy.Publisher("/Mendivil_pub", String, queue_size=10)
"""