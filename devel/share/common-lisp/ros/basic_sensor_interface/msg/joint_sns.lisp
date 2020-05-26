; Auto-generated. Do not edit!


(cl:in-package basic_sensor_interface-msg)


;//! \htmlinclude joint_sns.msg.html

(cl:defclass <joint_sns> (roslisp-msg-protocol:ros-message)
  ((prox1
    :reader prox1
    :initarg :prox1
    :type cl:integer
    :initform 0)
   (dist1
    :reader dist1
    :initarg :dist1
    :type cl:integer
    :initform 0)
   (prox2
    :reader prox2
    :initarg :prox2
    :type cl:integer
    :initform 0)
   (dist2
    :reader dist2
    :initarg :dist2
    :type cl:integer
    :initform 0)
   (prox3
    :reader prox3
    :initarg :prox3
    :type cl:integer
    :initform 0)
   (dist3
    :reader dist3
    :initarg :dist3
    :type cl:integer
    :initform 0))
)

(cl:defclass joint_sns (<joint_sns>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <joint_sns>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'joint_sns)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name basic_sensor_interface-msg:<joint_sns> is deprecated: use basic_sensor_interface-msg:joint_sns instead.")))

(cl:ensure-generic-function 'prox1-val :lambda-list '(m))
(cl:defmethod prox1-val ((m <joint_sns>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_sensor_interface-msg:prox1-val is deprecated.  Use basic_sensor_interface-msg:prox1 instead.")
  (prox1 m))

(cl:ensure-generic-function 'dist1-val :lambda-list '(m))
(cl:defmethod dist1-val ((m <joint_sns>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_sensor_interface-msg:dist1-val is deprecated.  Use basic_sensor_interface-msg:dist1 instead.")
  (dist1 m))

(cl:ensure-generic-function 'prox2-val :lambda-list '(m))
(cl:defmethod prox2-val ((m <joint_sns>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_sensor_interface-msg:prox2-val is deprecated.  Use basic_sensor_interface-msg:prox2 instead.")
  (prox2 m))

(cl:ensure-generic-function 'dist2-val :lambda-list '(m))
(cl:defmethod dist2-val ((m <joint_sns>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_sensor_interface-msg:dist2-val is deprecated.  Use basic_sensor_interface-msg:dist2 instead.")
  (dist2 m))

(cl:ensure-generic-function 'prox3-val :lambda-list '(m))
(cl:defmethod prox3-val ((m <joint_sns>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_sensor_interface-msg:prox3-val is deprecated.  Use basic_sensor_interface-msg:prox3 instead.")
  (prox3 m))

(cl:ensure-generic-function 'dist3-val :lambda-list '(m))
(cl:defmethod dist3-val ((m <joint_sns>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_sensor_interface-msg:dist3-val is deprecated.  Use basic_sensor_interface-msg:dist3 instead.")
  (dist3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <joint_sns>) ostream)
  "Serializes a message object of type '<joint_sns>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'prox1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'prox1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'prox1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'prox1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dist1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dist1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'dist1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'dist1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'prox2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'prox2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'prox2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'prox2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dist2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dist2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'dist2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'dist2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'prox3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'prox3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'prox3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'prox3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dist3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dist3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'dist3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'dist3)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <joint_sns>) istream)
  "Deserializes a message object of type '<joint_sns>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'prox1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'prox1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'prox1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'prox1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dist1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dist1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'dist1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'dist1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'prox2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'prox2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'prox2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'prox2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dist2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dist2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'dist2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'dist2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'prox3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'prox3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'prox3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'prox3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dist3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dist3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'dist3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'dist3)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<joint_sns>)))
  "Returns string type for a message object of type '<joint_sns>"
  "basic_sensor_interface/joint_sns")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'joint_sns)))
  "Returns string type for a message object of type 'joint_sns"
  "basic_sensor_interface/joint_sns")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<joint_sns>)))
  "Returns md5sum for a message object of type '<joint_sns>"
  "0370817355f4d293f185fcd9ba10ba17")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'joint_sns)))
  "Returns md5sum for a message object of type 'joint_sns"
  "0370817355f4d293f185fcd9ba10ba17")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<joint_sns>)))
  "Returns full string definition for message of type '<joint_sns>"
  (cl:format cl:nil "uint32 prox1~%uint32 dist1~%uint32 prox2~%uint32 dist2~%uint32 prox3~%uint32 dist3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'joint_sns)))
  "Returns full string definition for message of type 'joint_sns"
  (cl:format cl:nil "uint32 prox1~%uint32 dist1~%uint32 prox2~%uint32 dist2~%uint32 prox3~%uint32 dist3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <joint_sns>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <joint_sns>))
  "Converts a ROS message object to a list"
  (cl:list 'joint_sns
    (cl:cons ':prox1 (prox1 msg))
    (cl:cons ':dist1 (dist1 msg))
    (cl:cons ':prox2 (prox2 msg))
    (cl:cons ':dist2 (dist2 msg))
    (cl:cons ':prox3 (prox3 msg))
    (cl:cons ':dist3 (dist3 msg))
))
