(defmodule MAIN (export ?ALL))

(deftemplate  MAIN::preference
   (slot name)
   (multislot value))

(deftemplate MAIN::phone
	(slot label (default ?NONE))
	(slot brand)
	(slot price)
	(slot camera)
	(slot battery)
	(slot screenSize)
)

(deftemplate MAIN::phone-count
	(slot label (default ?NONE))
	(slot count (type INTEGER) (default 0))
	(multislot matched)
)

(deffunction MAIN::phone-modify-count (?label ?count-value ?matched)
	(bind ?facts (find-all-facts ((?f phone-count)) (eq ?f:label ?label)))
	(bind ?m (nth$ 1 ?facts))
	(modify ?m (count (+ (fact-slot-value ?m count) ?count-value)) (matched (fact-slot-value ?m matched) ?matched)))

(deffunction MAIN::phone-modify-count-no (?label ?count-value)
	(bind ?facts (find-all-facts ((?f phone-count)) (eq ?f:label ?label)))
	(bind ?m (nth$ 1 ?facts))
	(modify ?m (count (- (fact-slot-value ?m count) ?count-value))))


(deffunction MAIN::phone-sort (?m1 ?m2)
   (> (fact-slot-value ?m1 count)
          (fact-slot-value ?m2 count)))

(deffunction MAIN::get-phone-list ()
  (bind ?facts (find-all-facts ((?f phone-count))
                               (> ?f:count 0)))
  (sort phone-sort ?facts))
