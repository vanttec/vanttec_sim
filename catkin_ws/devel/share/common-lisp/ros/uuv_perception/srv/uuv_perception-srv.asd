
(cl:in-package :asdf)

(defsystem "uuv_perception-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "color_id" :depends-on ("_package_color_id"))
    (:file "_package_color_id" :depends-on ("_package"))
  ))