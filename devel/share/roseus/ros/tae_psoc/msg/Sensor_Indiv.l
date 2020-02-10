;; Auto-generated. Do not edit!


(when (boundp 'tae_psoc::Sensor_Indiv)
  (if (not (find-package "TAE_PSOC"))
    (make-package "TAE_PSOC"))
  (shadow 'Sensor_Indiv (find-package "TAE_PSOC")))
(unless (find-package "TAE_PSOC::SENSOR_INDIV")
  (make-package "TAE_PSOC::SENSOR_INDIV"))

(in-package "ROS")
;;//! \htmlinclude Sensor_Indiv.msg.html


(defclass tae_psoc::Sensor_Indiv
  :super ros::object
  :slots (_sns_1_Indiv _sns_2_Indiv _sns_3_Indiv ))

(defmethod tae_psoc::Sensor_Indiv
  (:init
   (&key
    ((:sns_1_Indiv __sns_1_Indiv) (make-array 0 :initial-element 0 :element-type :integer))
    ((:sns_2_Indiv __sns_2_Indiv) (make-array 0 :initial-element 0 :element-type :integer))
    ((:sns_3_Indiv __sns_3_Indiv) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _sns_1_Indiv __sns_1_Indiv)
   (setq _sns_2_Indiv __sns_2_Indiv)
   (setq _sns_3_Indiv __sns_3_Indiv)
   self)
  (:sns_1_Indiv
   (&optional __sns_1_Indiv)
   (if __sns_1_Indiv (setq _sns_1_Indiv __sns_1_Indiv)) _sns_1_Indiv)
  (:sns_2_Indiv
   (&optional __sns_2_Indiv)
   (if __sns_2_Indiv (setq _sns_2_Indiv __sns_2_Indiv)) _sns_2_Indiv)
  (:sns_3_Indiv
   (&optional __sns_3_Indiv)
   (if __sns_3_Indiv (setq _sns_3_Indiv __sns_3_Indiv)) _sns_3_Indiv)
  (:serialization-length
   ()
   (+
    ;; int16[] _sns_1_Indiv
    (* 2    (length _sns_1_Indiv)) 4
    ;; int16[] _sns_2_Indiv
    (* 2    (length _sns_2_Indiv)) 4
    ;; int16[] _sns_3_Indiv
    (* 2    (length _sns_3_Indiv)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16[] _sns_1_Indiv
     (write-long (length _sns_1_Indiv) s)
     (dotimes (i (length _sns_1_Indiv))
       (write-word (elt _sns_1_Indiv i) s)
       )
     ;; int16[] _sns_2_Indiv
     (write-long (length _sns_2_Indiv) s)
     (dotimes (i (length _sns_2_Indiv))
       (write-word (elt _sns_2_Indiv i) s)
       )
     ;; int16[] _sns_3_Indiv
     (write-long (length _sns_3_Indiv) s)
     (dotimes (i (length _sns_3_Indiv))
       (write-word (elt _sns_3_Indiv i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16[] _sns_1_Indiv
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_1_Indiv (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sns_1_Indiv i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _sns_2_Indiv
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_2_Indiv (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sns_2_Indiv i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _sns_3_Indiv
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_3_Indiv (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sns_3_Indiv i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get tae_psoc::Sensor_Indiv :md5sum-) "b388094140ac5a2ba7cc9329470ad33d")
(setf (get tae_psoc::Sensor_Indiv :datatype-) "tae_psoc/Sensor_Indiv")
(setf (get tae_psoc::Sensor_Indiv :definition-)
      "int16[] sns_1_Indiv
int16[] sns_2_Indiv
int16[] sns_3_Indiv

")



(provide :tae_psoc/Sensor_Indiv "b388094140ac5a2ba7cc9329470ad33d")


