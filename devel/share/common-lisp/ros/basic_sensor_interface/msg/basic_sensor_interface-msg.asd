
(cl:in-package :asdf)

(defsystem "basic_sensor_interface-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "joint_sns" :depends-on ("_package_joint_sns"))
    (:file "_package_joint_sns" :depends-on ("_package"))
    (:file "tendon_sns" :depends-on ("_package_tendon_sns"))
    (:file "_package_tendon_sns" :depends-on ("_package"))
  ))