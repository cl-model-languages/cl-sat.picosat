#|
  This file is a part of cl-sat.picosat project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#


(in-package :cl-user)
(defpackage cl-sat.picosat.test-asd
  (:use :cl :asdf))
(in-package :cl-sat.picosat.test-asd)


(defsystem cl-sat.picosat.test
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :description "Test system of cl-sat.picosat"
  :license "LLGPL"
  :depends-on (:cl-sat.picosat
               :fiveam)
  :components ((:module "t"
                :components
                ((:file "package"))))
  :perform (test-op :after (op c) (eval
 (read-from-string
  "(5am:run! :cl-sat.picosat)"))
))
