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

;; [TODO] Rewrite this using recursion instead of maps baby

; ;; Travels down each route collecting a list of pos
; (defun travel-routes (vectors)
;   (let ((pos '(0 0)))
;     (let ((stops (map 'list (travel pos) vectors)))
;       (length (remove-duplicates(append (list pos) stops) :test #'equal)))))


; ;; Travels down a route
; (defun travel (pos)
;   (lambda (vec)
;     (let ((newX (+ (car vec) (car pos)))
;           (newY (+ (cadr vec) (cadr pos))))
;       (setq pos (list newX newY))
;       pos)))

(defun travel-routes (vectors)
  (format t "List of vectors: ~d~%" vectors))

;; Map through each direction in the list
(let ((directions-list (read-in-file "day3input.txt")))
  (let ((vectors (remove nil(map 'list #'get-direction directions-list))))
    (travel-routes vectors)))
