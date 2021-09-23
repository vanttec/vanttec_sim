;; Auto-generated. Do not edit!


(when (boundp 'uuv_perception::color_id)
  (if (not (find-package "UUV_PERCEPTION"))
    (make-package "UUV_PERCEPTION"))
  (shadow 'color_id (find-package "UUV_PERCEPTION")))
(unless (find-package "UUV_PERCEPTION::COLOR_ID")
  (make-package "UUV_PERCEPTION::COLOR_ID"))
(unless (find-package "UUV_PERCEPTION::COLOR_IDREQUEST")
  (make-package "UUV_PERCEPTION::COLOR_IDREQUEST"))
(unless (find-package "UUV_PERCEPTION::COLOR_IDRESPONSE")
  (make-package "UUV_PERCEPTION::COLOR_IDRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass uuv_perception::color_idRequest
  :super ros::object
  :slots (_imagen _x _y _h _w ))

(defmethod uuv_perception::color_idRequest
  (:init
   (&key
    ((:imagen __imagen) (instance sensor_msgs::Image :init))
    ((:x __x) 0)
    ((:y __y) 0)
    ((:h __h) 0)
    ((:w __w) 0)
    )
   (send-super :init)
   (setq _imagen __imagen)
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _h (round __h))
   (setq _w (round __w))
   self)
  (:imagen
   (&rest __imagen)
   (if (keywordp (car __imagen))
       (send* _imagen __imagen)
     (progn
       (if __imagen (setq _imagen (car __imagen)))
       _imagen)))
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:h
   (&optional __h)
   (if __h (setq _h __h)) _h)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _imagen
    (send _imagen :serialization-length)
    ;; int64 _x
    8
    ;; int64 _y
    8
    ;; int64 _h
    8
    ;; int64 _w
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _imagen
       (send _imagen :serialize s)
     ;; int64 _x
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _x (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _x) (= (length (_x . bv)) 2)) ;; bignum
              (write-long (ash (elt (_x . bv) 0) 0) s)
              (write-long (ash (elt (_x . bv) 1) -1) s))
             ((and (class _x) (= (length (_x . bv)) 1)) ;; big1
              (write-long (elt (_x . bv) 0) s)
              (write-long (if (>= _x 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _x s)(write-long (if (>= _x 0) 0 #xffffffff) s)))
     ;; int64 _y
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _y (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _y) (= (length (_y . bv)) 2)) ;; bignum
              (write-long (ash (elt (_y . bv) 0) 0) s)
              (write-long (ash (elt (_y . bv) 1) -1) s))
             ((and (class _y) (= (length (_y . bv)) 1)) ;; big1
              (write-long (elt (_y . bv) 0) s)
              (write-long (if (>= _y 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _y s)(write-long (if (>= _y 0) 0 #xffffffff) s)))
     ;; int64 _h
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _h (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _h) (= (length (_h . bv)) 2)) ;; bignum
              (write-long (ash (elt (_h . bv) 0) 0) s)
              (write-long (ash (elt (_h . bv) 1) -1) s))
             ((and (class _h) (= (length (_h . bv)) 1)) ;; big1
              (write-long (elt (_h . bv) 0) s)
              (write-long (if (>= _h 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _h s)(write-long (if (>= _h 0) 0 #xffffffff) s)))
     ;; int64 _w
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _w (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _w) (= (length (_w . bv)) 2)) ;; bignum
              (write-long (ash (elt (_w . bv) 0) 0) s)
              (write-long (ash (elt (_w . bv) 1) -1) s))
             ((and (class _w) (= (length (_w . bv)) 1)) ;; big1
              (write-long (elt (_w . bv) 0) s)
              (write-long (if (>= _w 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _w s)(write-long (if (>= _w 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _imagen
     (send _imagen :deserialize buf ptr-) (incf ptr- (send _imagen :serialization-length))
   ;; int64 _x
#+(or :alpha :irix6 :x86_64)
      (setf _x (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _x (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _y
#+(or :alpha :irix6 :x86_64)
      (setf _y (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _y (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _h
#+(or :alpha :irix6 :x86_64)
      (setf _h (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _h (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _w
#+(or :alpha :irix6 :x86_64)
      (setf _w (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _w (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass uuv_perception::color_idResponse
  :super ros::object
  :slots (_color ))

(defmethod uuv_perception::color_idResponse
  (:init
   (&key
    ((:color __color) "")
    )
   (send-super :init)
   (setq _color (string __color))
   self)
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:serialization-length
   ()
   (+
    ;; string _color
    4 (length _color)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _color
       (write-long (length _color) s) (princ _color s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass uuv_perception::color_id
  :super ros::object
  :slots ())

(setf (get uuv_perception::color_id :md5sum-) "9bf569996655985b2700639f8b6c0833")
(setf (get uuv_perception::color_id :datatype-) "uuv_perception/color_id")
(setf (get uuv_perception::color_id :request) uuv_perception::color_idRequest)
(setf (get uuv_perception::color_id :response) uuv_perception::color_idResponse)

(defmethod uuv_perception::color_idRequest
  (:response () (instance uuv_perception::color_idResponse :init)))

(setf (get uuv_perception::color_idRequest :md5sum-) "9bf569996655985b2700639f8b6c0833")
(setf (get uuv_perception::color_idRequest :datatype-) "uuv_perception/color_idRequest")
(setf (get uuv_perception::color_idRequest :definition-)
      "sensor_msgs/Image imagen
int64 x
int64 y
int64 h
int64 w

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
string color

")

(setf (get uuv_perception::color_idResponse :md5sum-) "9bf569996655985b2700639f8b6c0833")
(setf (get uuv_perception::color_idResponse :datatype-) "uuv_perception/color_idResponse")
(setf (get uuv_perception::color_idResponse :definition-)
      "sensor_msgs/Image imagen
int64 x
int64 y
int64 h
int64 w

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
string color

")



(provide :uuv_perception/color_id "9bf569996655985b2700639f8b6c0833")


