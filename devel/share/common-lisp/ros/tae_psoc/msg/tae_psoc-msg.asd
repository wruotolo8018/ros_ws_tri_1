
(cl:in-package :asdf)

(defsystem "tae_psoc-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SensorPacket" :depends-on ("_package_SensorPacket"))
    (:file "_package_SensorPacket" :depends-on ("_package"))
    (:file "Sensor_Fast" :depends-on ("_package_Sensor_Fast"))
    (:file "_package_Sensor_Fast" :depends-on ("_package"))
    (:file "Sensor_Indiv" :depends-on ("_package_Sensor_Indiv"))
    (:file "_package_Sensor_Indiv" :depends-on ("_package"))
    (:file "cmdToPsoc" :depends-on ("_package_cmdToPsoc"))
    (:file "_package_cmdToPsoc" :depends-on ("_package"))
  ))