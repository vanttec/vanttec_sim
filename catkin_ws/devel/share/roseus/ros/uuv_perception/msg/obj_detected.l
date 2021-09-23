;; Auto-generated. Do not edit!


(when (boundp 'uuv_perception::obj_detected)
  (if (not (find-package "UUV_PERCEPTION"))
    (make-package "UUV_PERCEPTION"))
  (shadow 'obj_detected (find-package "UUV_PERCEPTION")))
(unless (find-package "UUV_PERCEPTION::OBJ_DETECTED")
  (make-package "UUV_PERCEPTION::OBJ_DETECTED"))

(in-package "ROS")
;;//! \htmlinclude obj_detected.msg.html


(defclass uuv_perception::obj_detected
  :super ros::object
  :slots (_x _y _w _h _color _clase _X _Y ))

(defmethod uuv_perception::obj_detected
  (:init
   (&key
    ((:x __x) 0)
    ((:y __y) 0)
    ((:w __w) 0)
    ((:h __h) 0)
    ((:color __color) "")
    ((:clase __clase) "")
    ((:X __X) 0.0)
    ((:Y __Y) 0.0)
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _w (round __w))
   (setq _h (round __h))
   (setq _color (string __color))
   (setq _clase (string __clase))
   (setq _X (float __X))
   (setq _Y (float __Y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:h
   (&optional __h)
   (if __h (setq _h __h)) _h)
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:clase
   (&optional __clase)
   (if __clase (setq _clase __clase)) _clase)
  (:X
   (&optional __X)
   (if __X (setq _X __X)) _X)
  (:Y
   (&optional __Y)
   (if __Y (setq _Y __Y)) _Y)
  (:serialization-length
   ()
   (+
    ;; int64 _x
    8
    ;; int64 _y
    8
    ;; int64 _w
    8
    ;; int64 _h
    8
    ;; string _color
    4 (length _color)
    ;; string _clase
    4 (length _clase)
    ;; float32 _X
    4
    ;; float32 _Y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
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
     ;; string _color
       (write-long (length _color) s) (princ _color s)
     ;; string _clase
       (write-long (length _clase) s) (princ _clase s)
     ;; float32 _X
       (sys::poke _X (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Y
       (sys::poke _Y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
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
   ;; string _color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _clase
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _clase (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _X
     (setq _X (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Y
     (setq _Y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get uuv_perception::obj_detected :md5sum-) "da6765af81f6dec4fa013c786451a3ca")
(setf (get uuv_perception::obj_detected :datatype-) "uuv_perception/obj_detected")
(setf (get uuv_perception::obj_detected :definition-)
      "int64 x
int64 y
int64 w
int64 h
string color
string clase
float32 X
float32 Y

")



(provide :uuv_perception/obj_detected "da6765af81f6dec4fa013c786451a3ca")


