; Auto-generated. Do not edit!


(cl:in-package uuv_perception-msg)


;//! \htmlinclude obj_detected_list.msg.html

(cl:defclass <obj_detected_list> (roslisp-msg-protocol:ros-message)
  ((len
    :reader len
    :initarg :len
    :type cl:integer
    :initform 0)
   (objects
    :reader objects
    :initarg :objects
    :type (cl:vector uuv_perception-msg:obj_detected)
   :initform (cl:make-array 0 :element-type 'uuv_perception-msg:obj_detected :initial-element (cl:make-instance 'uuv_perception-msg:obj_detected))))
)

(cl:defclass obj_detected_list (<obj_detected_list>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <obj_detected_list>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'obj_detected_list)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uuv_perception-msg:<obj_detected_list> is deprecated: use uuv_perception-msg:obj_detected_list instead.")))

(cl:ensure-generic-function 'len-val :lambda-list '(m))
(cl:defmethod len-val ((m <obj_detected_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uuv_perception-msg:len-val is deprecated.  Use uuv_perception-msg:len instead.")
  (len m))

(cl:ensure-generic-function 'objects-val :lambda-list '(m))
(cl:defmethod objects-val ((m <obj_detected_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uuv_perception-msg:objects-val is deprecated.  Use uuv_perception-msg:objects instead.")
  (objects m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <obj_detected_list>) ostream)
  "Serializes a message object of type '<obj_detected_list>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objects))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <obj_detected_list>) istream)
  "Deserializes a message object of type '<obj_detected_list>"
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
  (cl:setf (cl:slot-value msg 'objects) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'uuv_perception-msg:obj_detected))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<obj_detected_list>)))
  "Returns string type for a message object of type '<obj_detected_list>"
  "uuv_perception/obj_detected_list")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'obj_detected_list)))
  "Returns string type for a message object of type 'obj_detected_list"
  "uuv_perception/obj_detected_list")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<obj_detected_list>)))
  "Returns md5sum for a message object of type '<obj_detected_list>"
  "0af283cd0813ba18e9c1091f872861db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'obj_detected_list)))
  "Returns md5sum for a message object of type 'obj_detected_list"
  "0af283cd0813ba18e9c1091f872861db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<obj_detected_list>)))
  "Returns full string definition for message of type '<obj_detected_list>"
  (cl:format cl:nil "int64 len~%obj_detected[] objects~%~%================================================================================~%MSG: uuv_perception/obj_detected~%int64 x~%int64 y~%int64 w~%int64 h~%string color~%string clase~%float32 X~%float32 Y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'obj_detected_list)))
  "Returns full string definition for message of type 'obj_detected_list"
  (cl:format cl:nil "int64 len~%obj_detected[] objects~%~%================================================================================~%MSG: uuv_perception/obj_detected~%int64 x~%int64 y~%int64 w~%int64 h~%string color~%string clase~%float32 X~%float32 Y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <obj_detected_list>))
  (cl:+ 0
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <obj_detected_list>))
  "Converts a ROS message object to a list"
  (cl:list 'obj_detected_list
    (cl:cons ':len (len msg))
    (cl:cons ':objects (objects msg))
))
