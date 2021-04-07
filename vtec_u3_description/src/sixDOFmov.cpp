 #include "../include/sixDOFmov.hpp"
 
 namespace gazebo 
 {
 
   sixDOFmove::sixDOFmove() {}
 
   sixDOFmove::~sixDOFmove() {}
 
   // Load the controller 
   void sixDOFmove::Load(physics::ModelPtr parent, 
       sdf::ElementPtr sdf) 
   {
 
     parent_ = parent;
 
     /* Parse parameters */
 
     robot_namespace_ = "";
     if (!sdf->HasElement("robotNamespace")) 
     {
       ROS_INFO("PlanarMovePlugin missing <robotNamespace>, "
           "defaults to \"%s\"", robot_namespace_.c_str());
     }
     else 
     {
       robot_namespace_ = 
         sdf->GetElement("robotNamespace")->Get<std::string>();
     }
 
     command_topic_ = "cmd_vel";
     if (!sdf->HasElement("commandTopic")) 
     {
       ROS_WARN("PlanarMovePlugin (ns = %s) missing <commandTopic>, "
           "defaults to \"%s\"", 
           robot_namespace_.c_str(), command_topic_.c_str());
     } 
     else 
     {
       command_topic_ = sdf->GetElement("commandTopic")->Get<std::string>();
     }
 
     odometry_topic_ = "odom";
     if (!sdf->HasElement("odometryTopic")) 
     {
       ROS_WARN("PlanarMovePlugin (ns = %s) missing <odometryTopic>, "
           "defaults to \"%s\"", 
           robot_namespace_.c_str(), odometry_topic_.c_str());
     } 
     else 
     {
       odometry_topic_ = sdf->GetElement("odometryTopic")->Get<std::string>();
     }
 
     odometry_frame_ = "odom";
     if (!sdf->HasElement("odometryFrame")) 
     {
       ROS_WARN("PlanarMovePlugin (ns = %s) missing <odometryFrame>, "
           "defaults to \"%s\"",
           robot_namespace_.c_str(), odometry_frame_.c_str());
     }
     else 
     {
       odometry_frame_ = sdf->GetElement("odometryFrame")->Get<std::string>();
     }
 
     robot_base_frame_ = "base_footprint";
     if (!sdf->HasElement("robotBaseFrame")) 
     {
       ROS_WARN("PlanarMovePlugin (ns = %s) missing <robotBaseFrame>, "
           "defaults to \"%s\"",
           robot_namespace_.c_str(), robot_base_frame_.c_str());
     } 
     else 
     {
       robot_base_frame_ = sdf->GetElement("robotBaseFrame")->Get<std::string>();
     } 
 
     odometry_rate_ = 100.0;
     if (!sdf->HasElement("odometryRate")) 
     {
       ROS_WARN("PlanarMovePlugin (ns = %s) missing <odometryRate>, "
           "defaults to %f",
           robot_namespace_.c_str(), odometry_rate_);
     } 
     else 
     {
       odometry_rate_ = sdf->GetElement("odometryRate")->Get<double>();
     } 
  
     last_odom_publish_time_ = parent_->GetWorld()->GetSimTime();
     last_odom_pose_ = parent_->GetWorldPose();
     x_ = 0;
     y_ = 0;
     z_ = 0;
     roll_ = 0;
     pitch_ = 0;
     yaw_ = 0;
     alive_ = true;
 
     // Ensure that ROS has been initialized and subscribe to cmd_vel
     if (!ros::isInitialized()) 
     {
       ROS_FATAL_STREAM("PlanarMovePlugin (ns = " << robot_namespace_
         << "). A ROS node for Gazebo has not been initialized, "
         << "unable to load plugin. Load the Gazebo system plugin "
         << "'libgazebo_ros_api_plugin.so' in the gazebo_ros package)");
       return;
     }
     rosnode_.reset(new ros::NodeHandle(robot_namespace_));
 
     ROS_DEBUG("OCPlugin (%s) has started!", 
         robot_namespace_.c_str());
 
     tf_prefix_ = tf::getPrefixParam(*rosnode_);
     transform_broadcaster_.reset(new tf::TransformBroadcaster());
 
     // subscribe to the odometry topic
     ros::SubscribeOptions so =
       ros::SubscribeOptions::create<geometry_msgs::Twist>(command_topic_, 1,
           boost::bind(&sixDOFmove::cmdVelCallback, this, _1),
           ros::VoidPtr(), &queue_);
 
     vel_sub_ = rosnode_->subscribe(so);
     odometry_pub_ = rosnode_->advertise<nav_msgs::Odometry>(odometry_topic_, 1);
 
     // start custom queue for diff drive
     callback_queue_thread_ = 
       boost::thread(boost::bind(&sixDOFmove::QueueThread, this));
 
     // listen to the update event (broadcast every simulation iteration)
     update_connection_ = 
       event::Events::ConnectWorldUpdateBegin(
           boost::bind(&sixDOFmove::UpdateChild, this));
 
   }
 
   // Update the controller
   void sixDOFmove::UpdateChild() 
   {
     boost::mutex::scoped_lock scoped_lock(lock);
     math::Pose pose = parent_->GetWorldPose();
     float yaw = pose.rot.GetYaw();
     float pitch = pose.rot.GetPitch();
     float roll = pose.rot.GetRoll();
     parent_->SetLinearVel(math::Vector3(
           x_ * cosf(yaw) - y_ * sinf(yaw), //+ x_ * cosf(pitch) + z_ * sinf(pitch), 
           y_ * cosf(yaw) + x_ * sinf(yaw),// + y_ * cosf(roll) - z_ * sinf(roll),
           z_// * cosf(pitch) - x_ * sinf(pitch) + z_ * cosf(roll) + y_ * sinf(roll)
           ));
     parent_->SetAngularVel(math::Vector3(roll_, pitch_, yaw_));
     if (odometry_rate_ > 0.0) {
       common::Time current_time = parent_->GetWorld()->GetSimTime();
       double seconds_since_last_update = 
         (current_time - last_odom_publish_time_).Double();
       if (seconds_since_last_update > (1.0 / odometry_rate_)) {
         publishOdometry(seconds_since_last_update);
         last_odom_publish_time_ = current_time;
       }
     }
   }
 
   // Finalize the controller
   void sixDOFmove::FiniChild() {
     alive_ = false;
     queue_.clear();
     queue_.disable();
     rosnode_->shutdown();
     callback_queue_thread_.join();
   }
 
   void sixDOFmove::cmdVelCallback(
       const geometry_msgs::Twist::ConstPtr& cmd_msg) 
   {
     boost::mutex::scoped_lock scoped_lock(lock);
     x_ = cmd_msg->linear.x;
     y_ = cmd_msg->linear.y;
     z_ = cmd_msg->linear.z;
     roll_ = cmd_msg->angular.x;
     pitch_ = cmd_msg->angular.y;
     yaw_ = cmd_msg->angular.z;
   }
 
   void sixDOFmove::QueueThread() 
   {
     static const double timeout = 0.01;
     while (alive_ && rosnode_->ok()) 
     {
       queue_.callAvailable(ros::WallDuration(timeout));
     }
   }
 
   void sixDOFmove::publishOdometry(double step_time) 
   {
 
     ros::Time current_time = ros::Time::now();
     std::string odom_frame = tf::resolve(tf_prefix_, odometry_frame_);
     std::string base_footprint_frame = 
       tf::resolve(tf_prefix_, robot_base_frame_);
 
     // getting data for base_footprint to odom transform
     math::Pose pose = this->parent_->GetWorldPose();
 
     tf::Quaternion qt(pose.rot.x, pose.rot.y, pose.rot.z, pose.rot.w);
     tf::Vector3 vt(pose.pos.x, pose.pos.y, pose.pos.z);
 
     tf::Transform base_footprint_to_odom(qt, vt);
     transform_broadcaster_->sendTransform(
         tf::StampedTransform(base_footprint_to_odom, current_time, odom_frame,
             base_footprint_frame));
 
     // publish odom topic
     odom_.pose.pose.position.x = pose.pos.x;
     odom_.pose.pose.position.y = pose.pos.y;
     odom_.pose.pose.position.z = pose.pos.z;
 
     odom_.pose.pose.orientation.x = pose.rot.x;
     odom_.pose.pose.orientation.y = pose.rot.y;
     odom_.pose.pose.orientation.z = pose.rot.z;
     odom_.pose.pose.orientation.w = pose.rot.w;
     odom_.pose.covariance[0] = 0.00001;
     odom_.pose.covariance[7] = 0.00001;
     odom_.pose.covariance[14] = 1000000000000.0;
     odom_.pose.covariance[21] = 1000000000000.0;
     odom_.pose.covariance[28] = 1000000000000.0;
     odom_.pose.covariance[35] = 0.001;
 
     // get velocity in /odom frame
     math::Vector3 linear;
     linear.x = (pose.pos.x - last_odom_pose_.pos.x) / step_time;
     linear.y = (pose.pos.y - last_odom_pose_.pos.y) / step_time;
     linear.z = (pose.pos.z - last_odom_pose_.pos.z) / step_time;
     if (yaw_ > M_PI / step_time) 
     { 
       // we cannot calculate the angular velocity correctly
       odom_.twist.twist.angular.z = yaw_;
     } 
     else 
     {
       float last_yaw = last_odom_pose_.rot.GetYaw();
       float current_yaw = pose.rot.GetYaw();
       while (current_yaw < last_yaw - M_PI) current_yaw += 2 * M_PI;
       while (current_yaw > last_yaw + M_PI) current_yaw -= 2 * M_PI;
       float angular_diff = current_yaw - last_yaw;
       odom_.twist.twist.angular.z = angular_diff / step_time;
     }
     if (roll_ > M_PI / step_time) 
     { 
       // we cannot calculate the angular velocity correctly
       odom_.twist.twist.angular.x = roll_;
     } 
     else 
     {
       float last_roll = last_odom_pose_.rot.GetRoll();
       float current_roll = pose.rot.GetRoll();
       while (current_roll < last_roll - M_PI) current_roll += 2 * M_PI;
       while (current_roll > last_roll + M_PI) current_roll -= 2 * M_PI;
       float angular_diff = current_roll - last_roll;
       odom_.twist.twist.angular.x = angular_diff / step_time;
     }
     if (pitch_ > M_PI / step_time) 
     { 
       // we cannot calculate the angular velocity correctly
       odom_.twist.twist.angular.y = pitch_;
     } 
     else 
     {
       float last_pitch = last_odom_pose_.rot.GetPitch();
       float current_pitch = pose.rot.GetPitch();
       while (current_pitch < last_pitch - M_PI) current_pitch += 2 * M_PI;
       while (current_pitch > last_pitch + M_PI) current_pitch -= 2 * M_PI;
       float angular_diff = current_pitch - last_pitch;
       odom_.twist.twist.angular.y = angular_diff / step_time;
     }
     last_odom_pose_ = pose;
 
     // convert velocity to child_frame_id (aka base_footprint)
     float roll = pose.rot.GetRoll();
     float pitch = pose.rot.GetPitch();
     float yaw = pose.rot.GetYaw(); 
     odom_.twist.twist.linear.x = cosf(yaw) * linear.x + sinf(yaw) * linear.y;// + cosf(pitch) * linear.x - sinf(pitch) * linear.z;
     odom_.twist.twist.linear.y = cosf(yaw) * linear.y - sinf(yaw) * linear.x;// + cosf(roll) * linear.y + sinf(roll) * linear.z;
     odom_.twist.twist.linear.z = linear.z;// cosf(pitch) * linear.z + sinf(pitch) * linear.x + cosf(roll) * linear.z - sinf(roll) * linear.y;
 
     odom_.header.stamp = current_time;
     odom_.header.frame_id = odom_frame;
     odom_.child_frame_id = base_footprint_frame;
 
     odometry_pub_.publish(odom_);
   }
 
   GZ_REGISTER_MODEL_PLUGIN(sixDOFmove)
 }