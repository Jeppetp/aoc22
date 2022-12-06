(import sys)
(sys.setrecursionlimit 4096)

(with [f (open "input")]
  (setv input_text (.read f)))

(defn first_occurrence_n_distinct [n ret inp]
  (cond
    (= n (len (set (cut input_text (max 0 (- ret n)) ret)))) ret
    True (first_occurrence_n_distinct n (+ ret 1) inp)
    )
)
(print (first_occurrence_n_distinct 4 0 input_text))
(print (first_occurrence_n_distinct 14 0 input_text))
