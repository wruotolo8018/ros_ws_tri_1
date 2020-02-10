;; Auto-generated. Do not edit!


(when (boundp 'tae_psoc::Sensor_Fast)
  (if (not (find-package "TAE_PSOC"))
    (make-package "TAE_PSOC"))
  (shadow 'Sensor_Fast (find-package "TAE_PSOC")))
(unless (find-package "TAE_PSOC::SENSOR_FAST")
  (make-package "TAE_PSOC::SENSOR_FAST"))

(in-package "ROS")
;;//! \htmlinclude Sensor_Fast.msg.html


(defclass tae_psoc::Sensor_Fast
  :super ros::object
  :slots (_sns_1_Fast _sns_2_Fast _sns_3_Fast ))

(defmethod tae_psoc::Sensor_Fast
  (:init
   (&key
    ((:sns_1_Fast __sns_1_Fast) (make-array 0 :initial-element 0 :element-type :integer))
    ((:sns_2_Fast __sns_2_Fast) (make-array 0 :initial-element 0 :element-type :integer))
    ((:sns_3_Fast __sns_3_Fast) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _sns_1_Fast __sns_1_Fast)
   (setq _sns_2_Fast __sns_2_Fast)
   (setq _sns_3_Fast __sns_3_Fast)
   self)
  (:sns_1_Fast
   (&optional __sns_1_Fast)
   (if __sns_1_Fast (setq _sns_1_Fast __sns_1_Fast)) _sns_1_Fast)
  (:sns_2_Fast
   (&optional __sns_2_Fast)
   (if __sns_2_Fast (setq _sns_2_Fast __sns_2_Fast)) _sns_2_Fast)
  (:sns_3_Fast
   (&optional __sns_3_Fast)
   (if __sns_3_Fast (setq _sns_3_Fast __sns_3_Fast)) _sns_3_Fast)
  (:serialization-length
   ()
   (+
    ;; int16[] _sns_1_Fast
    (* 2    (length _sns_1_Fast)) 4
    ;; int16[] _sns_2_Fast
    (* 2    (length _sns_2_Fast)) 4
    ;; int16[] _sns_3_Fast
    (* 2    (length _sns_3_Fast)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16[] _sns_1_Fast
     (write-long (length _sns_1_Fast) s)
     (dotimes (i (length _sns_1_Fast))
       (write-word (elt _sns_1_Fast i) s)
       )
     ;; int16[] _sns_2_Fast
     (write-long (length _sns_2_Fast) s)
     (dotimes (i (length _sns_2_Fast))
       (write-word (elt _sns_2_Fast i) s)
       )
     ;; int16[] _sns_3_Fast
     (write-long (length _sns_3_Fast) s)
     (dotimes (i (length _sns_3_Fast))
       (write-word (elt _sns_3_Fast i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16[] _sns_1_Fast
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_1_Fast (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sns_1_Fast i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _sns_2_Fast
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_2_Fast (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sns_2_Fast i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _sns_3_Fast
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_3_Fast (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sns_3_Fast i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get tae_psoc::Sensor_Fast :md5sum-) "37b8e6d7402e8a51053039e4e2fc0b2c")
(setf (get tae_psoc::Sensor_Fast :datatype-) "tae_psoc/Sensor_Fast")
(setf (get tae_psoc::Sensor_Fast :definition-)
      "int16[] sns_1_Fast
int16[] sns_2_Fast
int16[] sns_3_Fast

")



(provide :tae_psoc/Sensor_Fast "37b8e6d7402e8a51053039e4e2fc0b2c")


