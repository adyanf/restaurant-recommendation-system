; Function for search the distance between user and the restaurant
(deffunction checkingDistance (?a ?b ?c ?d)
    (bind ?answer (sqrt (+ (** (- ?a ?c) 2) (** (- ?b ?d) 2))))

    (return ?answer)
)

