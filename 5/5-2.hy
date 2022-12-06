(import rich [print])

(with [f (open "input")]
  (setv input_lines (list (.readlines f))))

;;(print (.readlines (open "input")))


(setv starting_stacks (cut input_lines 8))
(setv move_sequence (cut input_lines 10 None))
(setv parsed_stacks
      (lfor x (range 9)
            (lfor y (range 8)
                  (get (get starting_stacks y) (+ 1 (* 4 x))))))

(defn remove_spaces [stacks]
  (lfor z stacks
        (lfor y z
        :if (!= y " ")
        y))
  )

(defn move_element [stacks src dest]
  (setv (get stacks (- dest 1)) (+ (cut (get stacks (- src 1)) 1) (get stacks (- dest 1))))
  (setv (get stacks (- src 1)) (cut (get stacks (- src 1)) 1 None))
  stacks
)

(defn move_n_elements [stacks n src dest]
  (setv moving_crates (cut (get stacks (- src 1)) None n))
  (setv (get stacks (- src 1)) (cut (get stacks (- src 1)) n None))
  (setv (get stacks (- dest 1)) (+ moving_crates (get stacks (- dest 1))))
  stacks
)

(defn line_to_pair [line]
  (setv cut_line (cut line 5 -1))
  (setv split_line (.split cut_line " "))
  (list (map int (cut split_line 0 None 2))))

(print starting_stacks)
(setv stacks (remove_spaces parsed_stacks))
(print (move_n_elements (remove_spaces parsed_stacks) 0 1 3))
(setv moves (list (map line_to_pair move_sequence)))

(for [move moves]
  (print move)
  (print stacks)
  (setv stacks (move_n_elements (remove_spaces stacks) (get move 0) (get move 1) (get move 2))))

(print stacks)
