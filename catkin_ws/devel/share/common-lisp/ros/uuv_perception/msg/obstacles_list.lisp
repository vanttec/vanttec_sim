; Auto-generated. Do not edit!


(cl:in-package uuv_perception-msg)


;//! \htmlinclude obstacles_list.msg.html

(cl:defclass <obstacles_list> (roslisp-msg-protocol:ros-message)
  ((len
    :reader len
    :initarg :len
    :type cl:integer
    :initform 0)
   (obstacles
    :reader obstacles
    :initarg :obstacles
    :type (cl:vector geometry_msgs-msg:Vector3)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Vector3 :initial-element (cl:make-instance 'geometry_msgs-msg:Vector3))))
)

(cl:defclass obstacles_list (<obstacles_list>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <obstacles_list>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'obstacles_list)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uuv_perception-msg:<obstacles_list> is deprecated: use uuv_perception-msg:obstacles_list instead.")))

(cl:ensure-generic-function 'len-val :lambda-list '(m))
(cl:defmethod len-val ((m <obstacles_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uuv_perception-msg:len-val is deprecated.  Use uuv_perception-msg:len instead.")
  (len m))

(cl:ensure-generic-function 'obstacles-val :lambda-list '(m))
(cl:defmethod obstacles-val ((m <obstacles_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uuv_perception-msg:obstacles-val is deprecated.  Use uuv_perception-msg:obstacles instead.")
  (obstacles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <obstacles_list>) ostream)
  "Serializes a message object of type '<obstacles_list>"
  (cl:let* ((signed (cl:slot-value msg 'len)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obstacles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obstacles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <obstacles_list>) istream)
  "Deserializes a message object of type '<obstacles_list>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'len) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obstacles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obstacles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Vector3))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<obstacles_list>)))
  "Returns string type for a message object of type '<obstacles_list>"
  "uuv_perception/obstacles_list")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'obstacles_list)))
  "Returns string type for a message object of type 'obstacles_list"
  "uuv_perception/obstacles_list")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<obstacles_list>)))
  "Returns md5sum for a message object of type '<obstacles_list>"
  "a453c0a1913f2b0504b7bfd6d9fa3f87")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'obstacles_list)))
  "Returns md5sum for a message object of type 'obstacles_list"
  "a453c0a1913f2b0504b7bfd6d9fa3f87")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<obstacles_list>)))
  "Returns full string definition for message of type '<obstacles_list>"
  (cl:format cl:nil "int64 len~%geometry_msgs/Vector3[] obstacles~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'obstacles_list)))
  "Returns full string definition for message of type 'obstacles_list"
  (cl:format cl:nil "int64 len~%geometry_msgs/Vector3[] obstacles~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <obstacles_list>))
  (cl:+ 0
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obstacles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <obstacles_list>))
  "Converts a ROS message object to a list"
  (cl:list 'obstacles_list
    (cl:cons ':len (len msg))
    (cl:cons ':obstacles (obstacles msg))
))
