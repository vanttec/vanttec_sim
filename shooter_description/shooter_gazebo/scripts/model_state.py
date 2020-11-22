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


def Publisher(): #Pose

    #Publish: (topic_name, message type ModelState)
    pose_publisher = rospy.Publisher("/gazebo/set_model_state", ModelState, queue_size=10)
    
    #Initiates node 
    rospy.init_node("Pose_Torpedoes", anonymous=False)

    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        model_state = ModelState()
        model_state.model_name = "torpedoes_1"
        model_state.pose.position.x = 1.0
        model_state.pose.position.y = 1.0
        model_state.pose.position.z = 0.0
        pose_publisher.publish(model_state)
        rate.sleep()

if __name__ == '__main__': 
    """try:
        Publisher()
    except rospy.ROSInterruptException:
        pass"""
    Publisher() 



