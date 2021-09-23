; Auto-generated. Do not edit!


(cl:in-package uuv_perception-msg)


;//! \htmlinclude obj_detected.msg.html

(cl:defclass <obj_detected> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0)
   (w
    :reader w
    :initarg :w
    :type cl:integer
    :initform 0)
   (h
    :reader h
    :initarg :h
    :type cl:integer
    :initform 0)
   (color
    :reader color
    :initarg :color
    :type cl:string
    :initform "")
   (clase
    :reader clase
    :initarg :clase
    :type cl:string
    :initform "")
   (X
    :reader X
    :initarg :X
    :type cl:float
    :initform 0.0)
   (Y
    :reader Y
    :initarg :Y
    :type cl:float
    :initform 0.0))
)

(cl:defclass obj_detected (<obj_detected>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <obj_detected>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'obj_detected)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uuv_perception-msg:<obj_detected> is deprecated: use uuv_perception-msg:obj_detected instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <obj_detected>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uuv_perception-msg:x-val is deprecated.  Use uuv_perception-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <obj_detected>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uuv_perception-msg:y-val is deprecated.  Use uuv_perception-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'w-val :lambda-list '(m))
(cl:defmethod w-val ((m <obj_detected>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uuv_perception-msg:w-val is deprecated.  Use uuv_perception-msg:w instead.")
  (w m))

(cl:ensure-generic-function 'h-val :lambda-list '(m))
(cl:defmethod h-val ((m <obj_detected>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uuv_perception-msg:h-val is deprecated.  Use uuv_perception-msg:h instead.")
  (h m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <obj_detected>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uuv_perception-msg:color-val is deprecated.  Use uuv_perception-msg:color instead.")
  (color m))

(cl:ensure-generic-function 'clase-val :lambda-list '(m))
(cl:defmethod clase-val ((m <obj_detected>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uuv_perception-msg:clase-val is deprecated.  Use uuv_perception-msg:clase instead.")
  (clase m))

(cl:ensure-generic-function 'X-val :lambda-list '(m))
(cl:defmethod X-val ((m <obj_detected>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uuv_perception-msg:X-val is deprecated.  Use uuv_perception-msg:X instead.")
  (X m))

(cl:ensure-generic-function 'Y-val :lambda-list '(m))
(cl:defmethod Y-val ((m <obj_detected>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uuv_perception-msg:Y-val is deprecated.  Use uuv_perception-msg:Y instead.")
  (Y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <obj_detected>) ostream)
  "Serializes a message object of type '<obj_detected>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'w)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'h)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'color))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'color))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'clase))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'clase))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'X))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <obj_detected>) istream)
  "Deserializes a message object of type '<obj_detected>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'w) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'h) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'color) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'color) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'clase) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'clase) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'X) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<obj_detected>)))
  "Returns string type for a message object of type '<obj_detected>"
  "uuv_perception/obj_detected")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'obj_detected)))
  "Returns string type for a message object of type 'obj_detected"
  "uuv_perception/obj_detected")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<obj_detected>)))
  "Returns md5sum for a message object of type '<obj_detected>"
  "da6765af81f6dec4fa013c786451a3ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'obj_detected)))
  "Returns md5sum for a message object of type 'obj_detected"
  "da6765af81f6dec4fa013c786451a3ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<obj_detected>)))
  "Returns full string definition for message of type '<obj_detected>"
  (cl:format cl:nil "int64 x~%int64 y~%int64 w~%int64 h~%string color~%string clase~%float32 X~%float32 Y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'obj_detected)))
  "Returns full string definition for message of type 'obj_detected"
  (cl:format cl:nil "int64 x~%int64 y~%int64 w~%int64 h~%string color~%string clase~%float32 X~%float32 Y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <obj_detected>))
  (cl:+ 0
     8
     8
     8
     8
     4 (cl:length (cl:slot-value msg 'color))
     4 (cl:length (cl:slot-value msg 'clase))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <obj_detected>))
  "Converts a ROS message object to a list"
  (cl:list 'obj_detected
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':w (w msg))
    (cl:cons ':h (h msg))
    (cl:cons ':color (color msg))
    (cl:cons ':clase (clase msg))
    (cl:cons ':X (X msg))
    (cl:cons ':Y (Y msg))
))
