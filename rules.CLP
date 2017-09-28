(defrule MAIN::start
	(declare (salience 99))
    ?state <- (state start)
    =>
    (printout t crlf)
    (printout t "Welcome to Advanced Mobiles Recommendation System" crlf)
    (printout t crlf)
    (assert (state question))))

(deffacts MAIN::start
    (state start))

(defrule MAIN::create-count
	(declare (salience 10))
	(phone (label ?label))
	=>
	(assert (phone-count (label ?label) (matched "")))
)



(defrule MAIN::ask-brand
    (declare (salience 89))
    (not (asked brand))
    =>
    (printout t "Select your preferred brand?" crlf)
    (printout t "(none/Apple/OnePlus/LeEco/MI/Samsung/Lenovo/Moto)" crlf)
    (bind ?response (read))
    (switch ?response
        (case Apple then (assert (preference (name brand) (value "Apple")))(assert (asked brand)))
        (case OnePlus then (assert (preference (name brand) (value "OnePlus")))(assert (asked brand)))
        (case LeEco then (assert (preference (name brand) (value "LeEco")))(assert (asked brand)))
        (case MI then (assert (preference (name brand) (value "MI")))(assert (asked brand)))
        (case Samsung then (assert (preference (name brand) (value "Samsung")))(assert (asked brand)))
        (case Lenovo then (assert (preference (name brand) (value "Lenovo")))(assert (asked brand)))
        (case Moto then (assert (preference (name brand) (value "Moto")))(assert (asked brand)))
        (default (printout t "OK. Lets consider all brands!" crlf)))
    )

(defrule MAIN::dec1
    (asked brand)
    (phone (label ?label))
=>
    (phone-modify-count-no ?label 100))

(defrule MAIN::get-input-brand
    (preference (name brand) (value ?brand))
    (phone (label ?label) (brand ?brand))
=>
    (phone-modify-count ?label 101 brand))



  
 

(defrule MAIN::ask-price_range
    (declare (salience 90))
    (not (asked price_range))
    =>
    (printout t "Select your preferred price range?" crlf)
    (printout t "(None/above_30k/25kto30k/20kto25k/15kto20k/10kto15k/5kto10k)" crlf)
    (bind ?response (read))
    (switch ?response
        (case above_30k then (assert (preference (name price) (value "above_30k")))(assert (asked price_range)))
        (case 25kto30k then (assert (preference (name price) (value "25kto30k")))(assert (asked price_range)))
        (case 20kto25k then (assert (preference (name price) (value "20kto25k")))(assert (asked price_range)))
        (case 15kto20k then (assert (preference (name price) (value "15kto20k")))(assert (asked price_range)))
        (case 10kto15k then (assert (preference (name price) (value "10kto15k")))(assert (asked price_range)))
        (case 5kto10k then (assert (preference (name price) (value "5kto10k")))(assert (asked price_range)))
        (default (printout t "OK. Lets consider all price_ranges!" crlf)))
    )


(defrule MAIN::dec2
(asked price_range)
    (phone (label ?label))
=>
    (phone-modify-count-no ?label 100))


(defrule MAIN::get-input-price
	(preference (name price) (value ?price))
	(phone (label ?label) (price ?price))
=>
	(phone-modify-count ?label 101 price))



	


(defrule MAIN::ask-camera
    (declare (salience 88))
    (not (asked camera))
    =>
    (printout t "Select your preferred camera?" crlf)
    (printout t "(None/5MP/8MP/13MP/16MP)" crlf)
    (bind ?response (read))
    (switch ?response
        (case 5MP then (assert (preference (name camera) (value "5MP")))(assert (asked camera)))
        (case 8MP then (assert (preference (name camera) (value "8MP")))(assert (asked camera)))
        (case 13MP then (assert (preference (name camera) (value "13MP")))(assert (asked camera)))
        (case 16MP then (assert (preference (name camera) (value "16MP")))(assert (asked camera)))
      	(default (printout t "OK. Lets consider all cameras!" crlf)))
    )


(defrule MAIN::dec3
(asked camera)
    (phone (label ?label))
=>
    (phone-modify-count-no ?label 100))


(defrule MAIN::get-input-camera
	(preference (name camera) (value ?camera))
	(phone (label ?label) (camera ?camera))
=>
	(phone-modify-count ?label 101 camera))






(defrule MAIN::ask-battery
    (declare (salience 86))
    (not (asked battery))
    =>
    (printout t "Select your preferred battery?" crlf)
    (printout t "(None/2000/3000/4000)" crlf)
    (bind ?response (read))
    (switch ?response
        (case 2000 then (assert (preference (name battery) (value "2000")))(assert (asked battery)))
        (case 3000 then (assert (preference (name battery) (value "3000")))(assert (asked battery)))
        (case 4000 then (assert (preference (name battery) (value "4000")))(assert (asked battery)))
        (default (printout t "OK. Lets consider all batteries!" crlf)))
    )


(defrule MAIN::dec4
(asked battery)
    (phone (label ?label))
=>
    (phone-modify-count-no ?label 100))


(defrule MAIN::get-input-battery
	(preference (name battery) (value ?battery))
	(phone (label ?label) (battery ?battery))
=>
	(phone-modify-count ?label 101 battery))






(defrule MAIN::ask-screenSize
    (declare (salience 87))
    (not (asked screenSize))
    =>
    (printout t "Select your preferred screenSize?" crlf)
    (printout t "(None/4.5/5/5.5)" crlf)
    (bind ?response (read))
    (switch ?response
        (case 4.5 then (assert (preference (name screenSize) (value "4.5")))(assert (asked screenSize)))
        (case 5 then (assert (preference (name screenSize) (value "5")))(assert (asked screenSize)))
        (case 5.5 then (assert (preference (name screenSize) (value "5.5")))(assert (asked screenSize)))
       (default (printout t "OK. Lets consider all screenSizes!" crlf)))
    )


(defrule MAIN::dec5
(asked screenSize)
    (phone (label ?label))
=>
    (phone-modify-count-no ?label 100))


(defrule MAIN::get-input-screenSize
	(preference (name screenSize) (value ?screenSize))
	(phone (label ?label) (screenSize ?screenSize))
=>
	(phone-modify-count ?label 101 screenSize))
