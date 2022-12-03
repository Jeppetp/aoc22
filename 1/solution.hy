;; open input and remove trailing newline
(with [f (open "input")]
  (setv input_text (str.strip (f.read)))
)

(defn split_newlines_to_ints [input_string]
      (list(map int (str.split input_string "\n" )))
)

(setv elves (.split input_text "\n\n"))

(setv elves_ints
      (list (map split_newlines_to_ints elves)))

(setv sorted_calories (sorted (list (map sum elves_ints))))


(print (get sorted_calories -1))
(print (sum (cut sorted_calories -3 None)))
