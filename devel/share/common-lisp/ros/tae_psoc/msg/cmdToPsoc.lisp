; Auto-generated. Do not edit!


(cl:in-package tae_psoc-msg)


;//! \htmlinclude cmdToPsoc.msg.html

(cl:defclass <cmdToPsoc> (roslisp-msg-protocol:ros-message)
  ((cmdInput
    :reader cmdInput
    :initarg :cmdInput
    :type cl:fixnum
    :initform 0))
)

(cl:defclass cmdToPsoc (<cmdToPsoc>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmdToPsoc>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmdToPsoc)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tae_psoc-msg:<cmdToPsoc> is deprecated: use tae_psoc-msg:cmdToPsoc instead.")))

(cl:ensure-generic-function 'cmdInput-val :lambda-list '(m))
(cl:defmethod cmdInput-val ((m <cmdToPsoc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tae_psoc-msg:cmdInput-val is deprecated.  Use tae_psoc-msg:cmdInput instead.")
  (cmdInput m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmdToPsoc>) ostream)
  "Serializes a message object of type '<cmdToPsoc>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmdInput)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cmdInput)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmdToPsoc>) istream)
  "Deserializes a message object of type '<cmdToPsoc>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmdInput)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cmdInput)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmdToPsoc>)))
  "Returns string type for a message object of type '<cmdToPsoc>"
  "tae_psoc/cmdToPsoc")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmdToPsoc)))
  "Returns string type for a message object of type 'cmdToPsoc"
  "tae_psoc/cmdToPsoc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmdToPsoc>)))
  "Returns md5sum for a message object of type '<cmdToPsoc>"
  "0f597ee8bf0974f4111872a37a845ee1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmdToPsoc)))
  "Returns md5sum for a message object of type 'cmdToPsoc"
  "0f597ee8bf0974f4111872a37a845ee1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmdToPsoc>)))
  "Returns full string definition for message of type '<cmdToPsoc>"
  (cl:format cl:nil "uint16 cmdInput~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmdToPsoc)))
  "Returns full string definition for message of type 'cmdToPsoc"
  (cl:format cl:nil "uint16 cmdInput~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmdToPsoc>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmdToPsoc>))
  "Converts a ROS message object to a list"
  (cl:list 'cmdToPsoc
    (cl:cons ':cmdInput (cmdInput msg))
))
