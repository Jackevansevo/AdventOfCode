(defun count-parens (input)
  (cond
    ((eql input #\() 1)
    ((eql input #\)) -1)))

(let ((in (open "day1input.txt")))
  (print (eval(cons '+ (map 'list #'count-parens (read-line in)))))
  (close in))
