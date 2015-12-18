;; Splits up an input string based on a given delimeter
(defun split-string (input delimeter)
  (loop for i = 0 then (1+ j)
        as j = (position delimeter input :start i)
        collect (subseq input i j)
        while j))

;; Calculates the amount of ribbon needed to wrap the present
(defun calc-ribbon (vals)
  (let ((sorted (sort vals #'<)))
    (apply '+ (list (eval (* 2(nth 0 sorted))) (eval (* 2 (nth 1 sorted)))))))


;; Calculates the amount of ribbon needed for the bow
(defun calc-bow (vals)
  (let ((l (nth 0 vals)) (w (nth 1 vals)) (h (nth 2 vals)))
    (apply '+ (list (eval (* l w h))))))


;; Open the file and loop through each line
(defun read-in-file (filename)
  (with-open-file (in filename)
    (loop for line = (read-line in nil)
          while line
          collect line)))


;; Calculates how much wrapping paper is needed for a given input
(defun calc-wrapping (line)
  (let ((dimensions (map 'list #'parse-integer (split-string line #\x))))
    (apply '+ (list (calc-ribbon dimensions) (calc-bow dimensions)))))


;; Open the file, iterate through each line and sum all the results
(let ((file-input (read-in-file "day2input.txt")))
  (format t "~d~%" (apply '+ (map 'list #'calc-wrapping file-input))))
