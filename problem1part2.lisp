;; Open the file and loop through each character
(defun read-in-file (filename)
  (with-open-file (in filename)
    (read-line in)))


;; Moves up and down each floor
(defun traverse-floors (directions &key (lvl 0) (pos 0))
  (if (< lvl 0)
    pos
    (cond
      ((eql (first directions) #\() 
       (traverse-floors (rest directions) :lvl (+ lvl 1) :pos (+ pos 1)))
      ((eql (first directions) #\)) 
       (traverse-floors (rest directions) :lvl (- lvl 1) :pos (+ pos 1))))))


;; Read in the entire line of directions
(let ((directions (read-in-file "day1input.txt")))
  ;; Convert array of characters to list and recurse through
  (let ((result (traverse-floors (coerce directions 'list))))
    (format t "Reaches basement at position: ~d~%" result)))
