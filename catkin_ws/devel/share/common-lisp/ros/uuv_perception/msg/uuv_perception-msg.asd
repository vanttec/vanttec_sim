
(cl:in-package :asdf)

(defsystem "uuv_perception-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "obj_detected" :depends-on ("_package_obj_detected"))
    (:file "_package_obj_detected" :depends-on ("_package"))
    (:file "obj_detected_list" :depends-on ("_package_obj_detected_list"))
    (:file "_package_obj_detected_list" :depends-on ("_package"))
    (:file "obstacles_list" :depends-on ("_package_obstacles_list"))
    (:file "_package_obstacles_list" :depends-on ("_package"))
  ))