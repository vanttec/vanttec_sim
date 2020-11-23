#!/usr/bin/env python
import rospy
import random
import numpy as np

from std_msgs.msg import Header
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Point, TransformStamped
from gazebo_msgs.msg import LinkState, LinkStates
from tf2_ros import TransformBroadcaster
from tf.transformations import euler_from_quaternion, quaternion_from_euler

global point_x
point_x = 0.0
global point_y
point_y = 0.0
global point_z
point_z = 0.0
global message_received
message_received = False

global TARGET_ARM_JOINT_POSITION
global JOINT_NAMES
JOINT_NAMES = []
global JOINT_POSES
JOINT_POSES = [0]
global POSITION_STEPS
POSITION_STEPS = []

NUM_INTERPOLATIONS = 500

def joint_states_callback(msg):
    global JOINT_NAMES
    JOINT_NAMES = msg.name
    # print(JOINT_NAMES)

    global JOINT_POSES
    JOINT_POSES = msg.pose
    # print(JOINT_POSES)

    # global JOINT_VELOCITIES
    # JOINT_VELOCITIES = msg.velocity
    # global JOINT_EFFORTS
    # JOINT_EFFORTS = msg.effort

def calculate_arm_target(point_3d):
    # if not message_received:
        # message_received = True
    alpha = 0.2
    rot_matrix = np.array([ [np.cos(alpha), -np.sin(alpha)] , [np.sin(alpha), np.cos(alpha)] ])
    camera_point_xz = np.array([ [point_3d.x], [point_3d.z] ])
    result = np.dot(np.linalg.inv(rot_matrix) , camera_point_xz)

    # print(rot_matrix)
    # print(camera_point_xz)
    # print(result)

    point_x = result[0][0] + 0.0
    point_y = point_3d.y + 0.0
    point_z = result[1][0] + 0.15
    print ("Current Joint Positions: %s" %(str(JOINT_POSES[2].position)))
    print("Objective: [%f,%f,%f]" % (point_x, point_y, point_z))

    # TARGET_ARM_JOINT_POSITION = point_x
    # print(TARGET_ARM_JOINT_POSITION)

    return point_x

def set_target(arm_joint_states):
    EXTEND = False
    OPEN_BEAMS = True
    CLOSE_BEAMS = False
    RETRACT = False

    rate = rospy.Rate(100)
    
    left_beam_link_state_gazebo = rospy.Publisher('/gazebo/set_link_state', LinkState, queue_size=10)
    right_beam_link_state_gazebo = rospy.Publisher('/gazebo/set_link_state', LinkState, queue_size=10)
    arm_link_state_gazebo = rospy.Publisher('/gazebo/set_link_state', LinkState, queue_size=10)
    left_tip_link_state_gazebo = rospy.Publisher('/gazebo/set_link_state', LinkState, queue_size=10)
    right_tip_link_state_gazebo = rospy.Publisher('/gazebo/set_link_state', LinkState, queue_size=10)
    target_camera = rospy.wait_for_message('target_position', Point)    
    arm_target = calculate_arm_target(target_camera)

    # broadcaster = TransformBroadcaster()
    # arm_new_tf = TransformStamped() # Stamped because you can assign a timestamp and frame_id

    # odom_trans = TransformStamped()
    # arm_joint_state = JointState()
    arm_link_state = LinkState()
    left_beam_link_state = LinkState()
    right_beam_link_state = LinkState()
    robot_arm_link_state = LinkState()
    left_tip_link_state = LinkState()
    right_tip_link_state = LinkState()

    # odom_trans.header.frame_id = "odom"
    # odom_trans.child_frame_id = "base_link"
    # arm_joint_state.name = JOINT_NAMES
    arm_link_state.link_name = "arm_link"
    left_beam_link_state.link_name = "left_beam_link"
    right_beam_link_state.link_name = "right_beam_link"
    left_tip_link_state.link_name = "left_tip_link"
    right_tip_link_state.link_name = "right_tip_link"

    arm_link_state.reference_frame = "world"
    left_beam_link_state.reference_frame = "world"
    right_beam_link_state.reference_frame = "world"
    left_tip_link_state.reference_frame = "world"
    right_tip_link_state.reference_frame = "world"

    current_interpolation = 0
    ARM_POSITION_STEPS = (arm_target - JOINT_POSES[2].position.x)/float (NUM_INTERPOLATIONS)
    euler = euler_from_quaternion([JOINT_POSES[3].orientation.x,JOINT_POSES[3].orientation.y,JOINT_POSES[3].orientation.z,JOINT_POSES[3].orientation.w])
    yaw = euler[2]
    LEFT_BEAM_POSITION_STEPS = (5 - yaw)/float (NUM_INTERPOLATIONS)
    euler = euler_from_quaternion([JOINT_POSES[5].orientation.x,JOINT_POSES[5].orientation.y,JOINT_POSES[5].orientation.z,JOINT_POSES[5].orientation.w])
    yaw = euler[2]
    RIGHT_BEAM_POSITION_STEPS = (-5 + yaw)/float (NUM_INTERPOLATIONS)
    
    while(not rospy.is_shutdown()):
        arm_link_state.pose.position.x = JOINT_POSES[2].position.x
        arm_link_state.pose.position.y = JOINT_POSES[2].position.y
        arm_link_state.pose.position.z = JOINT_POSES[2].position.z
        arm_link_state.pose.orientation.x = JOINT_POSES[2].orientation.x
        arm_link_state.pose.orientation.y = JOINT_POSES[2].orientation.y
        arm_link_state.pose.orientation.z = JOINT_POSES[2].orientation.z
        arm_link_state.pose.orientation.w = JOINT_POSES[2].orientation.w

        left_beam_link_state.pose.position.x = JOINT_POSES[3].position.x
        left_beam_link_state.pose.position.y = JOINT_POSES[3].position.y
        left_beam_link_state.pose.position.z = JOINT_POSES[3].position.z
        left_beam_link_state.pose.orientation.x = JOINT_POSES[3].orientation.x
        left_beam_link_state.pose.orientation.y = JOINT_POSES[3].orientation.y
        left_beam_link_state.pose.orientation.z = JOINT_POSES[3].orientation.z
        left_beam_link_state.pose.orientation.w = JOINT_POSES[3].orientation.w

        right_beam_link_state.pose.position.x = JOINT_POSES[5].position.x
        right_beam_link_state.pose.position.y = JOINT_POSES[5].position.y
        right_beam_link_state.pose.position.z = JOINT_POSES[5].position.z
        right_beam_link_state.pose.orientation.x = JOINT_POSES[5].orientation.x
        right_beam_link_state.pose.orientation.y = JOINT_POSES[5].orientation.y
        right_beam_link_state.pose.orientation.z = JOINT_POSES[5].orientation.z
        right_beam_link_state.pose.orientation.w = JOINT_POSES[5].orientation.w
        
        left_tip_link_state.pose.position.x = JOINT_POSES[4].position.x
        left_tip_link_state.pose.position.y = JOINT_POSES[4].position.y
        left_tip_link_state.pose.position.z = JOINT_POSES[4].position.z
        left_tip_link_state.pose.orientation.x = JOINT_POSES[4].orientation.x
        left_tip_link_state.pose.orientation.y = JOINT_POSES[4].orientation.y
        left_tip_link_state.pose.orientation.z = JOINT_POSES[4].orientation.z
        left_tip_link_state.pose.orientation.w = JOINT_POSES[4].orientation.w

        right_tip_link_state.pose.position.x = JOINT_POSES[6].position.x
        right_tip_link_state.pose.position.y = JOINT_POSES[6].position.y
        right_tip_link_state.pose.position.z = JOINT_POSES[6].position.z
        right_tip_link_state.pose.orientation.x = JOINT_POSES[6].orientation.x
        right_tip_link_state.pose.orientation.y = JOINT_POSES[6].orientation.y
        right_tip_link_state.pose.orientation.z = JOINT_POSES[6].orientation.z
        right_tip_link_state.pose.orientation.w = JOINT_POSES[6].orientation.w
                
        # arm_joint_state.header.stamp = rospy.Time.now()
        # odom_trans.header.stamp = rospy.Time.now()

        if OPEN_BEAMS and not EXTEND:
            if (current_interpolation < NUM_INTERPOLATIONS) and LEFT_BEAM_POSITION_STEPS and euler_from_quaternion([JOINT_POSES[3].orientation.x,JOINT_POSES[3].orientation.y,JOINT_POSES[3].orientation.z,JOINT_POSES[3].orientation.w])[2] < 5:
                rospy.loginfo("Opening gripper")
                current_interpolation += 1 
                # Left link
                left_beam_link_state.pose.position.x = JOINT_POSES[3].position.x
                left_beam_link_state.pose.position.y = JOINT_POSES[3].position.y
                left_beam_link_state.pose.position.z = JOINT_POSES[3].position.z
                euler = list(euler_from_quaternion([JOINT_POSES[3].orientation.x,JOINT_POSES[3].orientation.y,JOINT_POSES[3].orientation.z,JOINT_POSES[3].orientation.w]))
                new_euler = euler[2] + LEFT_BEAM_POSITION_STEPS
                print(new_euler)

                if (new_euler < 3 and new_euler > 1.5):
                    euler[2] = new_euler
                elif new_euler > 3:
                    euler[2] = 3
                elif new_euler < 1.5:
                    euler[2] = 1.5
                
                quaternion = quaternion_from_euler(euler[0],euler[1],euler[2])
                left_beam_link_state.pose.orientation.x = quaternion[0]
                left_beam_link_state.pose.orientation.y = quaternion[1]
                left_beam_link_state.pose.orientation.z = quaternion[2]
                left_beam_link_state.pose.orientation.w = quaternion[3]

                # Right link
                right_beam_link_state.pose.position.x = JOINT_POSES[5].position.x
                right_beam_link_state.pose.position.y = JOINT_POSES[5].position.y
                right_beam_link_state.pose.position.z = JOINT_POSES[5].position.z
                euler = list(euler_from_quaternion([JOINT_POSES[5].orientation.x,JOINT_POSES[5].orientation.y,JOINT_POSES[5].orientation.z,JOINT_POSES[5].orientation.w]))
                new_euler = euler[2] + RIGHT_BEAM_POSITION_STEPS
                print(new_euler)
                if (new_euler > 0 and new_euler < 1.5):
                    euler[2] = new_euler
                elif new_euler < 0:
                    euler[2] = 0
                elif new_euler > 1.5:
                    euler[2] = 1.5
                
                quaternion = quaternion_from_euler(euler[0],euler[1],euler[2])
                right_beam_link_state.pose.orientation.x = quaternion[0]
                right_beam_link_state.pose.orientation.y = quaternion[1]
                right_beam_link_state.pose.orientation.z = quaternion[2]
                right_beam_link_state.pose.orientation.w = quaternion[3]

            if (current_interpolation == NUM_INTERPOLATIONS - 1):
                current_interpolation = 0
                OPEN_BEAMS = False
                EXTEND = True

        elif EXTEND and not OPEN_BEAMS:
            if (current_interpolation < NUM_INTERPOLATIONS) and ARM_POSITION_STEPS and JOINT_POSES[2].position.x < 0.25:
                rospy.loginfo("Extending arm")
                current_interpolation += 1 
                # arm_joint_state.position = [JOINT_POSES[2].position.x + ARM_POSITION_STEPS, 0,0,0,0]
                arm_link_state.pose.position.x = JOINT_POSES[2].position.x + ARM_POSITION_STEPS
                arm_link_state.pose.position.y = JOINT_POSES[2].position.y
                arm_link_state.pose.position.z = JOINT_POSES[2].position.z
                arm_link_state.pose.orientation.x = JOINT_POSES[2].orientation.x
                arm_link_state.pose.orientation.y = JOINT_POSES[2].orientation.y
                arm_link_state.pose.orientation.z = JOINT_POSES[2].orientation.z
                arm_link_state.pose.orientation.w = JOINT_POSES[2].orientation.w

                # rospy.loginfo(arm_link_state.pose.position.x)
                # rospy.loginfo(arm_link_state.pose.position.y)
                # rospy.loginfo(arm_link_state.pose.position.z)
                # Publish robot joint state data to the topic
                # arm_joint_states.publish(arm_joint_state)

            if (current_interpolation == NUM_INTERPOLATIONS - 1):
                current_interpolation = 0
                EXTEND = False
                CLOSE_BEAMS = True
                
        elif CLOSE_BEAMS and not EXTEND:
            if (current_interpolation < NUM_INTERPOLATIONS) and LEFT_BEAM_POSITION_STEPS and euler_from_quaternion([JOINT_POSES[3].orientation.x,JOINT_POSES[3].orientation.y,JOINT_POSES[3].orientation.z,JOINT_POSES[3].orientation.w])[2] > 0:
                rospy.loginfo("Closing gripper")
                current_interpolation += 1 
                # Left link
                left_beam_link_state.pose.position.x = JOINT_POSES[3].position.x
                left_beam_link_state.pose.position.y = JOINT_POSES[3].position.y
                left_beam_link_state.pose.position.z = JOINT_POSES[3].position.z
                euler = list(euler_from_quaternion([JOINT_POSES[3].orientation.x,JOINT_POSES[3].orientation.y,JOINT_POSES[3].orientation.z,JOINT_POSES[3].orientation.w]))
                new_euler = euler[2] - 2*LEFT_BEAM_POSITION_STEPS
                print(new_euler)

                if (new_euler < 3 and new_euler > 1.5):
                    euler[2] = new_euler
                elif new_euler > 3:
                    euler[2] = 3
                elif new_euler < 1.5:
                    euler[2] = 1.5
                
                quaternion = quaternion_from_euler(euler[0],euler[1],euler[2])
                left_beam_link_state.pose.orientation.x = quaternion[0]
                left_beam_link_state.pose.orientation.y = quaternion[1]
                left_beam_link_state.pose.orientation.z = quaternion[2]
                left_beam_link_state.pose.orientation.w = quaternion[3]

                # Right link
                right_beam_link_state.pose.position.x = JOINT_POSES[5].position.x
                right_beam_link_state.pose.position.y = JOINT_POSES[5].position.y
                right_beam_link_state.pose.position.z = JOINT_POSES[5].position.z
                euler = list(euler_from_quaternion([JOINT_POSES[5].orientation.x,JOINT_POSES[5].orientation.y,JOINT_POSES[5].orientation.z,JOINT_POSES[5].orientation.w]))
                new_euler = euler[2] - 2*RIGHT_BEAM_POSITION_STEPS
                print(new_euler)
                if (new_euler > 0 and new_euler < 1.5):
                    euler[2] = new_euler
                elif new_euler < 0:
                    euler[2] = 0
                elif new_euler > 1.5:
                    euler[2] = 1.5
                
                quaternion = quaternion_from_euler(euler[0],euler[1],euler[2])
                right_beam_link_state.pose.orientation.x = quaternion[0]
                right_beam_link_state.pose.orientation.y = quaternion[1]
                right_beam_link_state.pose.orientation.z = quaternion[2]
                right_beam_link_state.pose.orientation.w = quaternion[3]


            if (current_interpolation == NUM_INTERPOLATIONS - 1):
                current_interpolation = 0
                CLOSE_BEAMS = False
                RETRACT = True

                left_tip_link_state.pose.orientation.x = 0.506777891893
                left_tip_link_state.pose.orientation.y = 0.493132202098
                left_tip_link_state.pose.orientation.z = 0.493129033239
                left_tip_link_state.pose.orientation.w = 0.5067746601

                right_tip_link_state.pose.orientation.x = 0.493248933477
                right_tip_link_state.pose.orientation.y = 0.50666381836
                right_tip_link_state.pose.orientation.z = 0.506661126802
                right_tip_link_state.pose.orientation.w = 0.493246152927

        elif RETRACT and not CLOSE_BEAMS:
            if (current_interpolation < NUM_INTERPOLATIONS) and ARM_POSITION_STEPS and JOINT_POSES[2].position.x > 0.05:
                rospy.loginfo("Retracting arm")
                current_interpolation += 1 
                # arm_joint_state.position = [JOINT_POSES[2].position.x + ARM_POSITION_STEPS, 0,0,0,0]
                arm_link_state.pose.position.x = JOINT_POSES[2].position.x - ARM_POSITION_STEPS
                arm_link_state.pose.position.y = JOINT_POSES[2].position.y
                arm_link_state.pose.position.z = JOINT_POSES[2].position.z
                arm_link_state.pose.orientation.x = JOINT_POSES[2].orientation.x
                arm_link_state.pose.orientation.y = JOINT_POSES[2].orientation.y
                arm_link_state.pose.orientation.z = JOINT_POSES[2].orientation.z
                arm_link_state.pose.orientation.w = JOINT_POSES[2].orientation.w
                
            if (current_interpolation == NUM_INTERPOLATIONS - 1):
                current_interpolation = 0
                RETRACT = False


        # update transform
        # odom_trans.transform.translation.x = 0
        # odom_trans.transform.translation.y = 0
        # odom_trans.transform.translation.z = 0
        # odom_trans.transform.rotation = tf::createQuaternionMsgFromYaw(0)

        # send the joint state and transform
        # arm_joint_states.publish(arm_joint_state)
        # broadcaster.sendTransform(odom_trans)

        arm_link_state_gazebo.publish(arm_link_state)
        left_beam_link_state_gazebo.publish(left_beam_link_state)
        right_beam_link_state_gazebo.publish(right_beam_link_state)
        left_tip_link_state_gazebo.publish(left_tip_link_state)
        right_tip_link_state_gazebo.publish(right_tip_link_state)

        rate.sleep()

if __name__ == "__main__":
    try:
        message_received = False
        rospy.init_node("State_publisher")

        rospy.Subscriber('/gazebo/link_states', LinkStates, joint_states_callback)
        arm_joint_states = rospy.Publisher('new_joint_states', JointState, queue_size=10)
        # rospy.Subscriber('target_position', Point, get_target_callback, message_received)
        set_target(arm_joint_states)
        
    except rospy.ROSInterruptException:
        pass