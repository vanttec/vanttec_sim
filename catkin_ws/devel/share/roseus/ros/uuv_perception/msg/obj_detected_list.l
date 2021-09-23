;; Auto-generated. Do not edit!


(when (boundp 'uuv_perception::obj_detected_list)
  (if (not (find-package "UUV_PERCEPTION"))
    (make-package "UUV_PERCEPTION"))
  (shadow 'obj_detected_list (find-package "UUV_PERCEPTION")))
(unless (find-package "UUV_PERCEPTION::OBJ_DETECTED_LIST")
  (make-package "UUV_PERCEPTION::OBJ_DETECTED_LIST"))

(in-package "ROS")
;;//! \htmlinclude obj_detected_list.msg.html


(defclass uuv_perception::obj_detected_list
  :super ros::object
  :slots (_len _objects ))

(defmethod uuv_perception::obj_detected_list
  (:init
   (&key
    ((:len __len) 0)
    ((:objects __objects) ())
    )
   (send-super :init)
   (setq _len (round __len))
   (setq _objects __objects)
   self)
  (:len
   (&optional __len)
   (if __len (setq _len __len)) _len)
  (:objects
   (&rest __objects)
   (if (keywordp (car __objects))
       (send* _objects __objects)
     (progn
       (if __objects (setq _objects (car __objects)))
       _objects)))
  (:serialization-length
   ()
   (+
    ;; int64 _len
    8
    ;; uuv_perception/obj_detected[] _objects
    (apply #'+ (send-all _objects :serialization-length)) 4
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
     ;; uuv_perception/obj_detected[] _objects
     (write-long (length _objects) s)
     (dolist (elem _objects)
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
   ;; uuv_perception/obj_detected[] _objects
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects (let (r) (dotimes (i n) (push (instance uuv_perception::obj_detected :init) r)) r))
     (dolist (elem- _objects)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get uuv_perception::obj_detected_list :md5sum-) "0af283cd0813ba18e9c1091f872861db")
(setf (get uuv_perception::obj_detected_list :datatype-) "uuv_perception/obj_detected_list")
(setf (get uuv_perception::obj_detected_list :definition-)
      "int64 len
obj_detected[] objects

================================================================================
MSG: uuv_perception/obj_detected
int64 x
int64 y
int64 w
int64 h
string color
string clase
float32 X
float32 Y

")



(provide :uuv_perception/obj_detected_list "0af283cd0813ba18e9c1091f872861db")


