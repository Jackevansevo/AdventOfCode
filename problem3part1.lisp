;; Open the file and loop through each character
(defun read-in-file (filename)
  (with-open-file (in filename)
    (loop for line = (read-char in nil)
          while line
          collect line)))


;; Converts direction symbols into vectors
(defun get-direction (direction)
  (cond
    ((eql direction #\^) '(0 1))
    ((eql direction #\>) '(1 0))
    ((eql direction #\v) '(0 -1))
    ((eql direction #\<) '(-1 0))))


;; Travel down each route recursively
(defun get-stops (vecs &key (stops (list '(0 0))))
  (if vecs
    (let ((newX (+ (car (first vecs)) (car (first stops))))
          (newY (+ (cadr (first vecs)) (cadr (first stops)))))
      (get-stops (rest vecs) :stops (cons (list newX newY) stops)))
    (length(remove-duplicates stops :test #'equal))))


;; Map through each direction in the list
(let ((directions-list (read-in-file "day3input.txt")))
  (let ((vectors (remove nil(map 'list #'get-direction directions-list))))
    (format t "~d~%" (get-stops vectors))))
