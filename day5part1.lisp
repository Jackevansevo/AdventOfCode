;; Checks if a given string is nice
(defun check-if-nice (input-string)
  (if (and
        (check-double input-string)
        (has-three-vowels input-string)
        (no-bad-substrings input-string)) T))


;; Checks if the string contains bad substrings
(defun no-bad-substrings (str)
  (let ((results  (map 'list (check-substrings str) '("ab" "cd" "pq" "xy"))))
    (notany #'integerp results)))


;; Returns clojure to check if substring contains target in a map
(defun check-substrings (str)
  (lambda (target) (search target str)))


;; Checks if word has three vowels
(defun has-three-vowels (str)
  (if (>= (count T (map 'list #'vowel-p str)) 3) T Nil))


;; Returns true if a character is a vowel
(defun vowel-p (char)
  (if (find char "aeiou" :test #'char-equal) T Nil))


;; Checks if the string contains any double letters
(defun check-double (input)
  (if input
    (if (> (length input) 1)
      (if (string-equal (subseq (reverse input) 0 1) (subseq (reverse input) 1 2))
        T
        (check-double (subseq input 0 (- (length input) 1)))))))


;; Open the file and loop through each character
(defun read-in-file (filename)
  (with-open-file (in filename)
    (loop for line = (read-line in nil)
          while line
          collect line)))


;; Reads in the input strings and checks if they're nice
(let ((strings (read-in-file "day5input.txt")))
  (format t "~d~%" (count T (map 'list #'check-if-nice strings))))
