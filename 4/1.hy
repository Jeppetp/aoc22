(require hyrule [defn+])

(defn input
(with [f (open "input")]
  (map str.strip (f.readlines))))


(defn pair_to_pairs [pair]
    (lfor
        x pair
        (list (map int (.split x "-")))))


(defn+ overlaps [[l1 l2]]
  (bool (& l1 l2)))

(defn line_to_pair [line]
  (list (pair_to_pairs (.split line ",")))
)

(defn pairs_to_sets [pairs_list]
  (lfor pair pairs_list
    (lfor x pair
            (set (range
            (get x 0)
            (+ (get x 1) 1))))))

(defn is_subset [l1 l2]
  (all (gfor x l1 (in x l2))))


(defn+ is_either_subset [[l1 l2]]
  (or
    (is_subset l1 l2)
    (is_subset l2 l1)))



;;(print input_text)
;;(print (line_to_pair "1-2,3-4"))
(print (sum (list (map overlaps (pairs_to_sets (list (map line_to_pair (input))))))
