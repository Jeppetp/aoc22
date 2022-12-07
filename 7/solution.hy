(import sys)
(sys.setrecursionlimit 10000)

(with [f (open "input")]
  (setv input_lines (.readlines f)))

(defn recursive_fucker [lines stack dir_sizes part_2]
  (if
    (= lines [])
    (let [sizes (+
                  dir_sizes
                  (lfor
                    x (range (len stack))
                    (sum (cut stack x None))))]

      (if
        part_2
        (min (lfor x sizes
                   :if (>= x (- (max sizes) 40000000))
                   x))
        (sum (lfor x sizes
                   :if (<= x 100000)
                   x))))
    (let [line (get lines 0)
          lines_rest (cut lines 1 None)]
      (cond
        (= line "$ cd ..\n")
        (recursive_fucker
          lines_rest
          (+ (cut stack -2) [(sum (cut stack -2 None))])
          (+ dir_sizes [(get stack -1)])
          part_2)
        (= (cut line 0 5) "$ cd ")
        (recursive_fucker
          lines_rest
          (+ stack [0])
          dir_sizes
          part_2)
        (in (get line 0) "0123456789")
        (recursive_fucker
          lines_rest
          (+ (cut stack -1) [(+ (get stack -1) (int (get (.split (get lines 0)) 0)))])
          dir_sizes
          part_2)
        True
        (recursive_fucker
          (cut lines 1 None)
          stack
          dir_sizes
          part_2)))))

(print (recursive_fucker input_lines [] [] False))
(print (recursive_fucker input_lines [] [] True))
