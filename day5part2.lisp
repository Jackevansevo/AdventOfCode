;; Checks if a given string is nice
(defun check-if-nice (input-string)
  (if (and
        (check-repeat-letter input-string)
        (check-repeat-pair input-string)) T))


;; Checks for repeat letters with one letter between them
(defun check-repeat-letter (input)
  (if input
    (if (> (length input) 2)
      (progn
        (if (and(string-equal (subseq input 0 1) (subseq input 2 3))
              (not (string-equal (subseq input 0 1) (subseq input 1 2))))
          T
          (check-repeat-letter (subseq input 1 (length input))))))))


;; Checks if word has three vowels
(defun check-repeat-pair (input)
  (if input
    (if (> (length input) 2)
      (if (search (subseq input 0 2) (subseq input 2 (length input)))
        T
        (check-repeat-pair (subseq input 1 (length input)))))))


;; Open the file and loop through each character
(defun read-in-file (filename)
  (with-open-file (in filename)
    (loop for line = (read-line in nil)
          while line
          collect line)))


;; Reads in the input strings and checks if they're nice
(let ((strings (read-in-file "day5input.txt")))
  (format t "~d~%" (count T (map 'list #'check-if-nice strings))))
