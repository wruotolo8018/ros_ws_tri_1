;; Auto-generated. Do not edit!


(when (boundp 'tae_psoc::cmdToPsoc)
  (if (not (find-package "TAE_PSOC"))
    (make-package "TAE_PSOC"))
  (shadow 'cmdToPsoc (find-package "TAE_PSOC")))
(unless (find-package "TAE_PSOC::CMDTOPSOC")
  (make-package "TAE_PSOC::CMDTOPSOC"))

(in-package "ROS")
;;//! \htmlinclude cmdToPsoc.msg.html


(defclass tae_psoc::cmdToPsoc
  :super ros::object
  :slots (_cmdInput ))

(defmethod tae_psoc::cmdToPsoc
  (:init
   (&key
    ((:cmdInput __cmdInput) 0)
    )
   (send-super :init)
   (setq _cmdInput (round __cmdInput))
   self)
  (:cmdInput
   (&optional __cmdInput)
   (if __cmdInput (setq _cmdInput __cmdInput)) _cmdInput)
  (:serialization-length
   ()
   (+
    ;; uint16 _cmdInput
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _cmdInput
       (write-word _cmdInput s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _cmdInput
     (setq _cmdInput (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get tae_psoc::cmdToPsoc :md5sum-) "0f597ee8bf0974f4111872a37a845ee1")
(setf (get tae_psoc::cmdToPsoc :datatype-) "tae_psoc/cmdToPsoc")
(setf (get tae_psoc::cmdToPsoc :definition-)
      "uint16 cmdInput

")



(provide :tae_psoc/cmdToPsoc "0f597ee8bf0974f4111872a37a845ee1")


