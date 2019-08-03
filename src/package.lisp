#|
  This file is a part of cl-sat.picosat project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-sat.picosat
  (:use :cl :trivia :alexandria :iterate :cl-sat))
(in-package :cl-sat.picosat)

;; blah blah blah.

(defvar *picosat-home* (asdf:system-relative-pathname :cl-sat.picosat "picosat/"))

(defun picosat-binary (&optional (*picosat-home* *picosat-home*))
  (if (trivial-package-manager:which "picosat")
      "picosat"
      (merge-pathnames "picosat" *picosat-home*)))

(defmethod solve ((input pathname) (solver (eql :picosat)) &rest options)
  (with-temp (dir :directory t :template "picosat.XXXXXXXX")
    (let* ((command (format nil "cd ~a; ~a ~{~A~^ ~} ~a"
                            (namestring dir)
                            (namestring (picosat-binary))
                            `("-o" "result" ,@options) (namestring input))))
      (format t "~&; ~a" command)
      (multiple-value-match (uiop:run-program command :output *standard-output* :error-output *error-output* :ignore-error-status t)
        ((_ _ 0)
         ;; indeterminite
         (values nil nil nil))
        ((_ _ 10)
         ;; sat
         (parse-dimacs-output (format nil "~a/result" dir) *instance*))
        ((_ _ 20)
         ;; unsat
         (values nil nil t))))))
