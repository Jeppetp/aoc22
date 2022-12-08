(import rich [print])
 
(with [f (open "input")]
  (setv raw_input (.readlines f)))
 
(print raw_input)
 
(defn line_to_int_list [line]
  (list (lfor c (cut line -1)
    (int c)
  )))
 
(defn transpose [grid]
  (lfor
    x (range (len (get grid 0)))
    (lfor
      y (range (len grid))
      (get grid y x)
    )
  )
)
 
(defn collapse [max_height grid]
  (lfor
   x (range (len grid))
    (lfor
      y (range (len (get grid 0)))
      (min (get grid x y) max_height)
    )
  )
)
 
(defn scenic_score [x y grid]
  (let
    [ tree_height (get grid x y)
      collapsed_grid (collapse tree_height grid)
      row (get collapsed_grid x)
      row_left (+ (list (reversed (cut row 1 y))) [tree_height])
      row_right (+ (list (cut row (+ y 1) -1)) [tree_height])
      col (get (transpose collapsed_grid) y)
      col_up (+ (list (reversed (cut col 1 x))) [tree_height])
      col_down (+ (list (cut col (+ x 1) -1)) [tree_height])
      directions [row_left row_right col_up col_down]]
 
      (* #*(map (fn [ls] (+ 1 (.index ls tree_height))) directions))))
 
(defn max_scenic_score [grid]
  (max
    (lfor
      x (range (- (len grid) 2))
      y (range (- (len grid) 2))
      (scenic_score (+ x 1) (+ y 1) grid)
    )
  )
)
 
;;(defn visible_trees [grid]
;;  (sum
;;    (lfor
;;      x (range (len (get grid 0)))
;;      y (range (len (get grid 0)))
;;      ;;(is_visible x y grid)
;;    ))
;;)

(defn grid [input] (list (map line_to_int_list raw_input)))
 
;;(print (visible_trees (grid raw_input)))

(print (max_scenic_score (grid raw_input)))
