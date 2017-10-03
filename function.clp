; Function for search the distance between user and the restaurant
(deffunction checkingDistance (?x1 ?y1 ?x2 ?y2)
    (bind ?answer (sqrt (+ (** (- ?x1 ?x2) 2) (** (- ?y1 ?y2) 2))))

    (return ?answer)
)

