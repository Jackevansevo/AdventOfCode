(with-open-file (stream "day1input.txt")
  (loop for paren = (read-char stream) with level = 0 with pos = 0
        until (eq level -1)
        do
        (setq pos (+ pos 1))
        (format t "~d ~d~%" level pos)
        (cond
          ((eql paren #\() (setq level (+ level 1)))
          ((eql paren #\)) (setq level (- level 1))))))
