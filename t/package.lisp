#|
  This file is a part of cl-sat.picosat project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#

(in-package :cl-user)
(defpackage :cl-sat.picosat.test
  (:use :cl
        :cl-sat.picosat
        :fiveam
        :trivia :alexandria :iterate :cl-sat))
(in-package :cl-sat.picosat.test)



(def-suite :cl-sat.picosat)
(in-suite :cl-sat.picosat)

;; run test with (run! test-name) 

(test cl-sat.picosat
  (is-true (nth-value 1 (solve '(and a b c) :picosat)))
  (is-true (nth-value 1 (solve '(or a b c) :picosat)))
  (is-true (nth-value 1 (solve '(and (or a !b c) d) :picosat)))
  (is-true (nth-value 1 (solve '(and (and (and a))) :picosat)))
  (is-true (nth-value 1 (solve '(not (and a b)) :picosat)))
  (is-true (nth-value 1 (solve '(not (or a b)) :picosat)))
  (is-false (nth-value 1 (solve '(and a !a) :picosat))))



