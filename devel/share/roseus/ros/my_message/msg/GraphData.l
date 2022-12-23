;; Auto-generated. Do not edit!


(when (boundp 'my_message::GraphData)
  (if (not (find-package "MY_MESSAGE"))
    (make-package "MY_MESSAGE"))
  (shadow 'GraphData (find-package "MY_MESSAGE")))
(unless (find-package "MY_MESSAGE::GRAPHDATA")
  (make-package "MY_MESSAGE::GRAPHDATA"))

(in-package "ROS")
;;//! \htmlinclude GraphData.msg.html


(defclass my_message::GraphData
  :super ros::object
  :slots (_ms_error _y_desired _y_sensed _x_value ))

(defmethod my_message::GraphData
  (:init
   (&key
    ((:ms_error __ms_error) 0.0)
    ((:y_desired __y_desired) 0.0)
    ((:y_sensed __y_sensed) 0.0)
    ((:x_value __x_value) 0.0)
    )
   (send-super :init)
   (setq _ms_error (float __ms_error))
   (setq _y_desired (float __y_desired))
   (setq _y_sensed (float __y_sensed))
   (setq _x_value (float __x_value))
   self)
  (:ms_error
   (&optional __ms_error)
   (if __ms_error (setq _ms_error __ms_error)) _ms_error)
  (:y_desired
   (&optional __y_desired)
   (if __y_desired (setq _y_desired __y_desired)) _y_desired)
  (:y_sensed
   (&optional __y_sensed)
   (if __y_sensed (setq _y_sensed __y_sensed)) _y_sensed)
  (:x_value
   (&optional __x_value)
   (if __x_value (setq _x_value __x_value)) _x_value)
  (:serialization-length
   ()
   (+
    ;; float32 _ms_error
    4
    ;; float32 _y_desired
    4
    ;; float32 _y_sensed
    4
    ;; float32 _x_value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _ms_error
       (sys::poke _ms_error (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y_desired
       (sys::poke _y_desired (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y_sensed
       (sys::poke _y_sensed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _x_value
       (sys::poke _x_value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _ms_error
     (setq _ms_error (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y_desired
     (setq _y_desired (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y_sensed
     (setq _y_sensed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _x_value
     (setq _x_value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get my_message::GraphData :md5sum-) "6b8316f3e4d87486410c1f8c55c6794f")
(setf (get my_message::GraphData :datatype-) "my_message/GraphData")
(setf (get my_message::GraphData :definition-)
      "float32 ms_error 
float32 y_desired
float32 y_sensed
float32 x_value

")



(provide :my_message/GraphData "6b8316f3e4d87486410c1f8c55c6794f")


