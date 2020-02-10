; Auto-generated. Do not edit!


(cl:in-package tae_psoc-msg)


;//! \htmlinclude Sensor_Indiv.msg.html

(cl:defclass <Sensor_Indiv> (roslisp-msg-protocol:ros-message)
  ((sns_1_Indiv
    :reader sns_1_Indiv
    :initarg :sns_1_Indiv
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (sns_2_Indiv
    :reader sns_2_Indiv
    :initarg :sns_2_Indiv
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (sns_3_Indiv
    :reader sns_3_Indiv
    :initarg :sns_3_Indiv
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass Sensor_Indiv (<Sensor_Indiv>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Sensor_Indiv>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Sensor_Indiv)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tae_psoc-msg:<Sensor_Indiv> is deprecated: use tae_psoc-msg:Sensor_Indiv instead.")))

(cl:ensure-generic-function 'sns_1_Indiv-val :lambda-list '(m))
(cl:defmethod sns_1_Indiv-val ((m <Sensor_Indiv>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tae_psoc-msg:sns_1_Indiv-val is deprecated.  Use tae_psoc-msg:sns_1_Indiv instead.")
  (sns_1_Indiv m))

(cl:ensure-generic-function 'sns_2_Indiv-val :lambda-list '(m))
(cl:defmethod sns_2_Indiv-val ((m <Sensor_Indiv>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tae_psoc-msg:sns_2_Indiv-val is deprecated.  Use tae_psoc-msg:sns_2_Indiv instead.")
  (sns_2_Indiv m))

(cl:ensure-generic-function 'sns_3_Indiv-val :lambda-list '(m))
(cl:defmethod sns_3_Indiv-val ((m <Sensor_Indiv>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tae_psoc-msg:sns_3_Indiv-val is deprecated.  Use tae_psoc-msg:sns_3_Indiv instead.")
  (sns_3_Indiv m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Sensor_Indiv>) ostream)
  "Serializes a message object of type '<Sensor_Indiv>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sns_1_Indiv))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'sns_1_Indiv))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sns_2_Indiv))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'sns_2_Indiv))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sns_3_Indiv))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'sns_3_Indiv))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Sensor_Indiv>) istream)
  "Deserializes a message object of type '<Sensor_Indiv>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sns_1_Indiv) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sns_1_Indiv)))
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
  (cl:setf (cl:slot-value msg 'sns_2_Indiv) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sns_2_Indiv)))
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
  (cl:setf (cl:slot-value msg 'sns_3_Indiv) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sns_3_Indiv)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Sensor_Indiv>)))
  "Returns string type for a message object of type '<Sensor_Indiv>"
  "tae_psoc/Sensor_Indiv")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Sensor_Indiv)))
  "Returns string type for a message object of type 'Sensor_Indiv"
  "tae_psoc/Sensor_Indiv")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Sensor_Indiv>)))
  "Returns md5sum for a message object of type '<Sensor_Indiv>"
  "b388094140ac5a2ba7cc9329470ad33d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Sensor_Indiv)))
  "Returns md5sum for a message object of type 'Sensor_Indiv"
  "b388094140ac5a2ba7cc9329470ad33d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Sensor_Indiv>)))
  "Returns full string definition for message of type '<Sensor_Indiv>"
  (cl:format cl:nil "int16[] sns_1_Indiv~%int16[] sns_2_Indiv~%int16[] sns_3_Indiv~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Sensor_Indiv)))
  "Returns full string definition for message of type 'Sensor_Indiv"
  (cl:format cl:nil "int16[] sns_1_Indiv~%int16[] sns_2_Indiv~%int16[] sns_3_Indiv~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Sensor_Indiv>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sns_1_Indiv) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sns_2_Indiv) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sns_3_Indiv) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Sensor_Indiv>))
  "Converts a ROS message object to a list"
  (cl:list 'Sensor_Indiv
    (cl:cons ':sns_1_Indiv (sns_1_Indiv msg))
    (cl:cons ':sns_2_Indiv (sns_2_Indiv msg))
    (cl:cons ':sns_3_Indiv (sns_3_Indiv msg))
))
