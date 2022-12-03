;; open input and remove trailing newline
(require hyrule [ap-each])
(with [f (open "input")]
  (setv input_text (str.strip (f.read)))
)

(defn split_lines [input_string]
      (str.split input_string "\n" ))

(print (split_lines input_text))

(setv robot_dict
      {"A" 0 "B" 1 "C" 2})

(setv human_dict
      {"X" 0 "Y" 1 "Z" 2})

(print (.get robot_dict "A"))

(defn match_to_int_pairs [match]
      (print match)
      [(.get robot_dict (get match 0)) (.get human_dict (get match 2))])

(setv int_pairs (list(map match_to_int_pairs (split_lines input_text))))
;;(ap-each int_pairs (print it))


(defn int_pair_to_points [int_pair]
      (setv choice_points (+ 1 (get int_pair 1)))
      (setv winner (% (- (get int_pair 1) (get int_pair 0)) 3))
      (setv winner_points (* 3 (% (+ 1 winner) 3)))
      (+ choice_points winner_points)
  )

(print (sum (list (map int_pair_to_points int_pairs))))




;; (setv elves (.split input_text "\n\n"))
;;
;; (setv elves_ints
;;       (list (map split_newlines_to_ints elves)))
;;
;; (setv sorted_calories (sorted (list (map sum elves_ints))))
;;
;;
;; (print (get sorted_calories -1))
;; (print (sum (cut sorted_calories -3 None)))
