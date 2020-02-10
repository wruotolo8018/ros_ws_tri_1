; Auto-generated. Do not edit!


(cl:in-package tae_psoc-msg)


;//! \htmlinclude Sensor_Fast.msg.html

(cl:defclass <Sensor_Fast> (roslisp-msg-protocol:ros-message)
  ((sns_1_Fast
    :reader sns_1_Fast
    :initarg :sns_1_Fast
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (sns_2_Fast
    :reader sns_2_Fast
    :initarg :sns_2_Fast
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (sns_3_Fast
    :reader sns_3_Fast
    :initarg :sns_3_Fast
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass Sensor_Fast (<Sensor_Fast>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Sensor_Fast>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Sensor_Fast)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tae_psoc-msg:<Sensor_Fast> is deprecated: use tae_psoc-msg:Sensor_Fast instead.")))

(cl:ensure-generic-function 'sns_1_Fast-val :lambda-list '(m))
(cl:defmethod sns_1_Fast-val ((m <Sensor_Fast>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tae_psoc-msg:sns_1_Fast-val is deprecated.  Use tae_psoc-msg:sns_1_Fast instead.")
  (sns_1_Fast m))

(cl:ensure-generic-function 'sns_2_Fast-val :lambda-list '(m))
(cl:defmethod sns_2_Fast-val ((m <Sensor_Fast>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tae_psoc-msg:sns_2_Fast-val is deprecated.  Use tae_psoc-msg:sns_2_Fast instead.")
  (sns_2_Fast m))

(cl:ensure-generic-function 'sns_3_Fast-val :lambda-list '(m))
(cl:defmethod sns_3_Fast-val ((m <Sensor_Fast>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tae_psoc-msg:sns_3_Fast-val is deprecated.  Use tae_psoc-msg:sns_3_Fast instead.")
  (sns_3_Fast m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Sensor_Fast>) ostream)
  "Serializes a message object of type '<Sensor_Fast>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sns_1_Fast))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'sns_1_Fast))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sns_2_Fast))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'sns_2_Fast))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sns_3_Fast))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'sns_3_Fast))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Sensor_Fast>) istream)
  "Deserializes a message object of type '<Sensor_Fast>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sns_1_Fast) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sns_1_Fast)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sns_2_Fast) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sns_2_Fast)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sns_3_Fast) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sns_3_Fast)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Sensor_Fast>)))
  "Returns string type for a message object of type '<Sensor_Fast>"
  "tae_psoc/Sensor_Fast")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Sensor_Fast)))
  "Returns string type for a message object of type 'Sensor_Fast"
  "tae_psoc/Sensor_Fast")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Sensor_Fast>)))
  "Returns md5sum for a message object of type '<Sensor_Fast>"
  "37b8e6d7402e8a51053039e4e2fc0b2c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Sensor_Fast)))
  "Returns md5sum for a message object of type 'Sensor_Fast"
  "37b8e6d7402e8a51053039e4e2fc0b2c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Sensor_Fast>)))
  "Returns full string definition for message of type '<Sensor_Fast>"
  (cl:format cl:nil "int16[] sns_1_Fast~%int16[] sns_2_Fast~%int16[] sns_3_Fast~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Sensor_Fast)))
  "Returns full string definition for message of type 'Sensor_Fast"
  (cl:format cl:nil "int16[] sns_1_Fast~%int16[] sns_2_Fast~%int16[] sns_3_Fast~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Sensor_Fast>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sns_1_Fast) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sns_2_Fast) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sns_3_Fast) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Sensor_Fast>))
  "Converts a ROS message object to a list"
  (cl:list 'Sensor_Fast
    (cl:cons ':sns_1_Fast (sns_1_Fast msg))
    (cl:cons ':sns_2_Fast (sns_2_Fast msg))
    (cl:cons ':sns_3_Fast (sns_3_Fast msg))
))
