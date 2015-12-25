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


;; Creates a list of stops along santas journey
(defun get-stops (vecs &key (stops (list '(0 0))))
  (if vecs
    (let ((newX (+ (car (first vecs)) (car (first stops))))
          (newY (+ (cadr (first vecs)) (cadr (first stops)))))
      (get-stops (rest vecs) :stops (cons (list newX newY) stops)))
    (remove-duplicates stops :test #'equal)))


;; Splits a list '(a b c d ...) into ('(a c) '(d b))
(defun split-list (list &optional (left '()) (right '()))
  (if (endp list)
    (list (nreverse left) (nreverse right))
    (split-list (rest (rest list))
                (list* (first list) left)
                (if (endp (rest list))
                  right
                  (list* (second list) right)))))


;; Map through each direction in the list
(let ((directions-list (read-in-file "day3input.txt")))
  ;; Save all the vectors to a list
  (let ((vectors (remove nil(map 'list #'get-direction directions-list))))
    ;; Split up the vector list into santa and robo santa stops
    (let ((santa (get-stops (car (split-list vectors))))
          (robo  (get-stops (cadr (split-list vectors)))))
      (let ((result (remove-duplicates(append santa robo) :test #'equal)))
        (format t "~d~%"  (length result))))))

