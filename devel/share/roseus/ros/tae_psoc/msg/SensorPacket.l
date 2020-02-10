;; Auto-generated. Do not edit!


(when (boundp 'tae_psoc::SensorPacket)
  (if (not (find-package "TAE_PSOC"))
    (make-package "TAE_PSOC"))
  (shadow 'SensorPacket (find-package "TAE_PSOC")))
(unless (find-package "TAE_PSOC::SENSORPACKET")
  (make-package "TAE_PSOC::SENSORPACKET"))

(in-package "ROS")
;;//! \htmlinclude SensorPacket.msg.html


(defclass tae_psoc::SensorPacket
  :super ros::object
  :slots (_sns_1_FFT_NS _sns_1_FFT_WE _sns_1_4Ch _sns_1_F_M _sns_2_FFT_NS _sns_2_FFT_WE _sns_2_4Ch _sns_2_F_M _sns1_vorticity _sns2_vorticity ))

(defmethod tae_psoc::SensorPacket
  (:init
   (&key
    ((:sns_1_FFT_NS __sns_1_FFT_NS) (make-array 0 :initial-element 0 :element-type :integer))
    ((:sns_1_FFT_WE __sns_1_FFT_WE) (make-array 0 :initial-element 0 :element-type :integer))
    ((:sns_1_4Ch __sns_1_4Ch) (make-array 0 :initial-element 0 :element-type :integer))
    ((:sns_1_F_M __sns_1_F_M) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:sns_2_FFT_NS __sns_2_FFT_NS) (make-array 0 :initial-element 0 :element-type :integer))
    ((:sns_2_FFT_WE __sns_2_FFT_WE) (make-array 0 :initial-element 0 :element-type :integer))
    ((:sns_2_4Ch __sns_2_4Ch) (make-array 0 :initial-element 0 :element-type :integer))
    ((:sns_2_F_M __sns_2_F_M) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:sns1_vorticity __sns1_vorticity) 0.0)
    ((:sns2_vorticity __sns2_vorticity) 0.0)
    )
   (send-super :init)
   (setq _sns_1_FFT_NS __sns_1_FFT_NS)
   (setq _sns_1_FFT_WE __sns_1_FFT_WE)
   (setq _sns_1_4Ch __sns_1_4Ch)
   (setq _sns_1_F_M __sns_1_F_M)
   (setq _sns_2_FFT_NS __sns_2_FFT_NS)
   (setq _sns_2_FFT_WE __sns_2_FFT_WE)
   (setq _sns_2_4Ch __sns_2_4Ch)
   (setq _sns_2_F_M __sns_2_F_M)
   (setq _sns1_vorticity (float __sns1_vorticity))
   (setq _sns2_vorticity (float __sns2_vorticity))
   self)
  (:sns_1_FFT_NS
   (&optional __sns_1_FFT_NS)
   (if __sns_1_FFT_NS (setq _sns_1_FFT_NS __sns_1_FFT_NS)) _sns_1_FFT_NS)
  (:sns_1_FFT_WE
   (&optional __sns_1_FFT_WE)
   (if __sns_1_FFT_WE (setq _sns_1_FFT_WE __sns_1_FFT_WE)) _sns_1_FFT_WE)
  (:sns_1_4Ch
   (&optional __sns_1_4Ch)
   (if __sns_1_4Ch (setq _sns_1_4Ch __sns_1_4Ch)) _sns_1_4Ch)
  (:sns_1_F_M
   (&optional __sns_1_F_M)
   (if __sns_1_F_M (setq _sns_1_F_M __sns_1_F_M)) _sns_1_F_M)
  (:sns_2_FFT_NS
   (&optional __sns_2_FFT_NS)
   (if __sns_2_FFT_NS (setq _sns_2_FFT_NS __sns_2_FFT_NS)) _sns_2_FFT_NS)
  (:sns_2_FFT_WE
   (&optional __sns_2_FFT_WE)
   (if __sns_2_FFT_WE (setq _sns_2_FFT_WE __sns_2_FFT_WE)) _sns_2_FFT_WE)
  (:sns_2_4Ch
   (&optional __sns_2_4Ch)
   (if __sns_2_4Ch (setq _sns_2_4Ch __sns_2_4Ch)) _sns_2_4Ch)
  (:sns_2_F_M
   (&optional __sns_2_F_M)
   (if __sns_2_F_M (setq _sns_2_F_M __sns_2_F_M)) _sns_2_F_M)
  (:sns1_vorticity
   (&optional __sns1_vorticity)
   (if __sns1_vorticity (setq _sns1_vorticity __sns1_vorticity)) _sns1_vorticity)
  (:sns2_vorticity
   (&optional __sns2_vorticity)
   (if __sns2_vorticity (setq _sns2_vorticity __sns2_vorticity)) _sns2_vorticity)
  (:serialization-length
   ()
   (+
    ;; uint16[] _sns_1_FFT_NS
    (* 2    (length _sns_1_FFT_NS)) 4
    ;; uint16[] _sns_1_FFT_WE
    (* 2    (length _sns_1_FFT_WE)) 4
    ;; int16[] _sns_1_4Ch
    (* 2    (length _sns_1_4Ch)) 4
    ;; float32[] _sns_1_F_M
    (* 4    (length _sns_1_F_M)) 4
    ;; uint16[] _sns_2_FFT_NS
    (* 2    (length _sns_2_FFT_NS)) 4
    ;; uint16[] _sns_2_FFT_WE
    (* 2    (length _sns_2_FFT_WE)) 4
    ;; int16[] _sns_2_4Ch
    (* 2    (length _sns_2_4Ch)) 4
    ;; float32[] _sns_2_F_M
    (* 4    (length _sns_2_F_M)) 4
    ;; float32 _sns1_vorticity
    4
    ;; float32 _sns2_vorticity
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16[] _sns_1_FFT_NS
     (write-long (length _sns_1_FFT_NS) s)
     (dotimes (i (length _sns_1_FFT_NS))
       (write-word (elt _sns_1_FFT_NS i) s)
       )
     ;; uint16[] _sns_1_FFT_WE
     (write-long (length _sns_1_FFT_WE) s)
     (dotimes (i (length _sns_1_FFT_WE))
       (write-word (elt _sns_1_FFT_WE i) s)
       )
     ;; int16[] _sns_1_4Ch
     (write-long (length _sns_1_4Ch) s)
     (dotimes (i (length _sns_1_4Ch))
       (write-word (elt _sns_1_4Ch i) s)
       )
     ;; float32[] _sns_1_F_M
     (write-long (length _sns_1_F_M) s)
     (dotimes (i (length _sns_1_F_M))
       (sys::poke (elt _sns_1_F_M i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; uint16[] _sns_2_FFT_NS
     (write-long (length _sns_2_FFT_NS) s)
     (dotimes (i (length _sns_2_FFT_NS))
       (write-word (elt _sns_2_FFT_NS i) s)
       )
     ;; uint16[] _sns_2_FFT_WE
     (write-long (length _sns_2_FFT_WE) s)
     (dotimes (i (length _sns_2_FFT_WE))
       (write-word (elt _sns_2_FFT_WE i) s)
       )
     ;; int16[] _sns_2_4Ch
     (write-long (length _sns_2_4Ch) s)
     (dotimes (i (length _sns_2_4Ch))
       (write-word (elt _sns_2_4Ch i) s)
       )
     ;; float32[] _sns_2_F_M
     (write-long (length _sns_2_F_M) s)
     (dotimes (i (length _sns_2_F_M))
       (sys::poke (elt _sns_2_F_M i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _sns1_vorticity
       (sys::poke _sns1_vorticity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sns2_vorticity
       (sys::poke _sns2_vorticity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16[] _sns_1_FFT_NS
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_1_FFT_NS (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sns_1_FFT_NS i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; uint16[] _sns_1_FFT_WE
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_1_FFT_WE (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sns_1_FFT_WE i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _sns_1_4Ch
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_1_4Ch (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sns_1_4Ch i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; float32[] _sns_1_F_M
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_1_F_M (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sns_1_F_M i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; uint16[] _sns_2_FFT_NS
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_2_FFT_NS (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sns_2_FFT_NS i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; uint16[] _sns_2_FFT_WE
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_2_FFT_WE (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sns_2_FFT_WE i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _sns_2_4Ch
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_2_4Ch (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sns_2_4Ch i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; float32[] _sns_2_F_M
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sns_2_F_M (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sns_2_F_M i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _sns1_vorticity
     (setq _sns1_vorticity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sns2_vorticity
     (setq _sns2_vorticity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get tae_psoc::SensorPacket :md5sum-) "b42cd8856cf6ff4337fc1ed6207fb9c0")
(setf (get tae_psoc::SensorPacket :datatype-) "tae_psoc/SensorPacket")
(setf (get tae_psoc::SensorPacket :definition-)
      "uint16[] sns_1_FFT_NS
uint16[] sns_1_FFT_WE
int16[] sns_1_4Ch
float32[] sns_1_F_M
uint16[] sns_2_FFT_NS
uint16[] sns_2_FFT_WE
int16[] sns_2_4Ch
float32[] sns_2_F_M
float32 sns1_vorticity
float32 sns2_vorticity


")



(provide :tae_psoc/SensorPacket "b42cd8856cf6ff4337fc1ed6207fb9c0")


