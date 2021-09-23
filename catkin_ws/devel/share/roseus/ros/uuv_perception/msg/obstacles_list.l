;; Auto-generated. Do not edit!


(when (boundp 'uuv_perception::obstacles_list)
  (if (not (find-package "UUV_PERCEPTION"))
    (make-package "UUV_PERCEPTION"))
  (shadow 'obstacles_list (find-package "UUV_PERCEPTION")))
(unless (find-package "UUV_PERCEPTION::OBSTACLES_LIST")
  (make-package "UUV_PERCEPTION::OBSTACLES_LIST"))

(in-package "ROS")
;;//! \htmlinclude obstacles_list.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass uuv_perception::obstacles_list
  :super ros::object
  :slots (_len _obstacles ))

(defmethod uuv_perception::obstacles_list
  (:init
   (&key
    ((:len __len) 0)
    ((:obstacles __obstacles) ())
    )
   (send-super :init)
   (setq _len (round __len))
   (setq _obstacles __obstacles)
   self)
  (:len
   (&optional __len)
   (if __len (setq _len __len)) _len)
  (:obstacles
   (&rest __obstacles)
   (if (keywordp (car __obstacles))
       (send* _obstacles __obstacles)
     (progn
       (if __obstacles (setq _obstacles (car __obstacles)))
       _obstacles)))
  (:serialization-length
   ()
   (+
    ;; int64 _len
    8
    ;; geometry_msgs/Vector3[] _obstacles
    (apply #'+ (send-all _obstacles :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _len
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _len (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _len) (= (length (_len . bv)) 2)) ;; bignum
              (write-long (ash (elt (_len . bv) 0) 0) s)
              (write-long (ash (elt (_len . bv) 1) -1) s))
             ((and (class _len) (= (length (_len . bv)) 1)) ;; big1
              (write-long (elt (_len . bv) 0) s)
              (write-long (if (>= _len 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _len s)(write-long (if (>= _len 0) 0 #xffffffff) s)))
     ;; geometry_msgs/Vector3[] _obstacles
     (write-long (length _obstacles) s)
     (dolist (elem _obstacles)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _len
#+(or :alpha :irix6 :x86_64)
      (setf _len (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _len (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; geometry_msgs/Vector3[] _obstacles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacles (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3 :init) r)) r))
     (dolist (elem- _obstacles)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get uuv_perception::obstacles_list :md5sum-) "a453c0a1913f2b0504b7bfd6d9fa3f87")
(setf (get uuv_perception::obstacles_list :datatype-) "uuv_perception/obstacles_list")
(setf (get uuv_perception::obstacles_list :definition-)
      "int64 len
geometry_msgs/Vector3[] obstacles
================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :uuv_perception/obstacles_list "a453c0a1913f2b0504b7bfd6d9fa3f87")


