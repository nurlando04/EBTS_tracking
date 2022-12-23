; Auto-generated. Do not edit!


(cl:in-package my_message-msg)


;//! \htmlinclude GraphData.msg.html

(cl:defclass <GraphData> (roslisp-msg-protocol:ros-message)
  ((ms_error
    :reader ms_error
    :initarg :ms_error
    :type cl:float
    :initform 0.0)
   (y_desired
    :reader y_desired
    :initarg :y_desired
    :type cl:float
    :initform 0.0)
   (y_sensed
    :reader y_sensed
    :initarg :y_sensed
    :type cl:float
    :initform 0.0)
   (x_value
    :reader x_value
    :initarg :x_value
    :type cl:float
    :initform 0.0))
)

(cl:defclass GraphData (<GraphData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraphData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraphData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_message-msg:<GraphData> is deprecated: use my_message-msg:GraphData instead.")))

(cl:ensure-generic-function 'ms_error-val :lambda-list '(m))
(cl:defmethod ms_error-val ((m <GraphData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:ms_error-val is deprecated.  Use my_message-msg:ms_error instead.")
  (ms_error m))

(cl:ensure-generic-function 'y_desired-val :lambda-list '(m))
(cl:defmethod y_desired-val ((m <GraphData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:y_desired-val is deprecated.  Use my_message-msg:y_desired instead.")
  (y_desired m))

(cl:ensure-generic-function 'y_sensed-val :lambda-list '(m))
(cl:defmethod y_sensed-val ((m <GraphData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:y_sensed-val is deprecated.  Use my_message-msg:y_sensed instead.")
  (y_sensed m))

(cl:ensure-generic-function 'x_value-val :lambda-list '(m))
(cl:defmethod x_value-val ((m <GraphData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:x_value-val is deprecated.  Use my_message-msg:x_value instead.")
  (x_value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraphData>) ostream)
  "Serializes a message object of type '<GraphData>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ms_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y_desired))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y_sensed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraphData>) istream)
  "Deserializes a message object of type '<GraphData>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ms_error) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_desired) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_sensed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_value) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraphData>)))
  "Returns string type for a message object of type '<GraphData>"
  "my_message/GraphData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraphData)))
  "Returns string type for a message object of type 'GraphData"
  "my_message/GraphData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraphData>)))
  "Returns md5sum for a message object of type '<GraphData>"
  "6b8316f3e4d87486410c1f8c55c6794f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraphData)))
  "Returns md5sum for a message object of type 'GraphData"
  "6b8316f3e4d87486410c1f8c55c6794f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraphData>)))
  "Returns full string definition for message of type '<GraphData>"
  (cl:format cl:nil "float32 ms_error ~%float32 y_desired~%float32 y_sensed~%float32 x_value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraphData)))
  "Returns full string definition for message of type 'GraphData"
  (cl:format cl:nil "float32 ms_error ~%float32 y_desired~%float32 y_sensed~%float32 x_value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraphData>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraphData>))
  "Converts a ROS message object to a list"
  (cl:list 'GraphData
    (cl:cons ':ms_error (ms_error msg))
    (cl:cons ':y_desired (y_desired msg))
    (cl:cons ':y_sensed (y_sensed msg))
    (cl:cons ':x_value (x_value msg))
))
