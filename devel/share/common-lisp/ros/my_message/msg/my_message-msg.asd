
(cl:in-package :asdf)

(defsystem "my_message-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GraphData" :depends-on ("_package_GraphData"))
    (:file "_package_GraphData" :depends-on ("_package"))
  ))