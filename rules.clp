(defrule opening
	(declare (salience 99))
	=>
	(printout t crlf)
	(printout t "Welcome to Restaurant Recommendation System" crlf)
	(printout t crlf)
	(assert (restaurantScore (restaurant "Restoran A") (score 0)))
	(assert (restaurantScore (restaurant "Restoran B") (score 0)))
	(assert (restaurantScore (restaurant "Restoran C") (score 0)))
	(assert (restaurantScore (restaurant "Restoran D") (score 0)))
	(assert (restaurantScore (restaurant "Restoran E") (score 0)))
	(assert (restaurantScore (restaurant "Restoran F") (score 0)))
	(assert (restaurantScore (restaurant "Restoran G") (score 0)))
	(assert (restaurantScore (restaurant "Restoran H") (score 0)))
	(assert (attChecked (restaurant "Restoran A") (name isSmoker) (value unchecked)))
	(assert (attChecked (restaurant "Restoran A") (name minBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran A") (name maxBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran A") (name dresscode) (value unchecked)))
	(assert (attChecked (restaurant "Restoran A") (name hasWifi) (value unchecked)))
	(assert (attChecked (restaurant "Restoran B") (name isSmoker) (value unchecked)))
	(assert (attChecked (restaurant "Restoran B") (name minBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran B") (name maxBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran B") (name dresscode) (value unchecked)))
	(assert (attChecked (restaurant "Restoran B") (name hasWifi) (value unchecked)))
	(assert (attChecked (restaurant "Restoran C") (name isSmoker) (value unchecked)))
	(assert (attChecked (restaurant "Restoran C") (name minBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran C") (name maxBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran C") (name dresscode) (value unchecked)))
	(assert (attChecked (restaurant "Restoran C") (name hasWifi) (value unchecked)))
	(assert (attChecked (restaurant "Restoran D") (name isSmoker) (value unchecked)))
	(assert (attChecked (restaurant "Restoran D") (name minBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran D") (name maxBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran D") (name dresscode) (value unchecked)))
	(assert (attChecked (restaurant "Restoran D") (name hasWifi) (value unchecked)))
	(assert (attChecked (restaurant "Restoran E") (name isSmoker) (value unchecked)))
	(assert (attChecked (restaurant "Restoran E") (name minBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran E") (name maxBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran E") (name dresscode) (value unchecked)))
	(assert (attChecked (restaurant "Restoran E") (name hasWifi) (value unchecked)))
	(assert (attChecked (restaurant "Restoran F") (name isSmoker) (value unchecked)))
	(assert (attChecked (restaurant "Restoran F") (name minBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran F") (name maxBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran F") (name dresscode) (value unchecked)))
	(assert (attChecked (restaurant "Restoran F") (name hasWifi) (value unchecked)))
	(assert (attChecked (restaurant "Restoran G") (name isSmoker) (value unchecked)))
	(assert (attChecked (restaurant "Restoran G") (name minBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran G") (name maxBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran G") (name dresscode) (value unchecked)))
	(assert (attChecked (restaurant "Restoran G") (name hasWifi) (value unchecked)))
	(assert (attChecked (restaurant "Restoran H") (name isSmoker) (value unchecked)))
	(assert (attChecked (restaurant "Restoran H") (name minBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran H") (name maxBudget) (value unchecked)))
	(assert (attChecked (restaurant "Restoran H") (name dresscode) (value unchecked)))
	(assert (attChecked (restaurant "Restoran H") (name hasWifi) (value unchecked)))
)

(defrule questionName
	(declare (salience 95))
	(not (asked name))
	=>
	(printout t "What is your name? ")
	(bind ?response (read))	
	(assert (userinfo (name ?response)))
)

(defrule questionSmoke
	(declare (salience 90))
	=>
	(printout t "Do you smoke? (yes,no) ")
	(bind ?response (read))
	(switch ?response
        	(case yes then (assert (preference (name smoke) (value True))))
        	(case no then (assert (preference (name smoke) (value False))))
        	(default (printout t "OK. Lets consider you don't smoke!" crlf)))
)

(defrule questionMinBudget
	(declare (salience 85))
	=>
	(printout t "What is your minimum budget? [0-9999] ")
	(bind ?response (read))
	(assert (preference (name minBudget) (value ?response)))
)

(defrule questionMaxBudget
	(declare (salience 80))
	=>
	(printout t "What is your maximum budget? [0-9999] ")
	(bind ?response (read))
	(assert (preference (name maxBudget) (value ?response)))
)

(defrule questionClothes
	(declare (salience 75))
	=>
	(printout t "What clothes are you wearing? (casual,informal,formal) ")
	(bind ?response (read))
	(assert (preference (name dresscode) (value ?response)))
)

(defrule questionWifi
	(declare (salience 70))
	=>
	(printout t "Do you want a restaurant with Wi-Fi? (yes/no) ")
	(bind ?response (read))
	(switch ?response
        	(case yes then (assert (preference (name wifi) (value True))))
        	(case no then (assert (preference (name wifi) (value False))))
        	(default (printout t "OK. Lets consider you need wifi!" crlf)))
)

(defrule pickRestaurantSmoker
	(declare (salience 50))
	(preference (name smoke) (value ?resSmoker))
	(restaurant (name ?nama) (isSmoker ?resSmoker) (minBudget ?resMinB) (maxBudget ?resMaxB) (dresscode ?resDc) (hasWifi ?resWifi))
	?fs <- (restaurantScore (restaurant ?nama) (score ?score))
	?fa <- (attChecked (restaurant ?nama) (name isSmoker) (value unchecked))
	=>
	(modify ?fs (score(+ 1 ?score)))
	(modify ?fa (value checked))
)

(defrule pickRestaurantWifi
	(declare (salience 45))
	(preference (name wifi) (value ?resWifi))
	(restaurant (name ?nama) (isSmoker ?resSmoker) (minBudget ?resMinB) (maxBudget ?resMaxB) (dresscode ?resDc) (hasWifi ?resWifi))
	?fs <- (restaurantScore (restaurant ?nama) (score ?score))
	?fa <- (attChecked (restaurant ?nama) (name hasWifi) (value unchecked))
	=>
	(modify ?fs (score(+ 1 ?score)))
	(modify ?fa (value checked))
)

(defrule pickRestaurantDresscode
	(declare (salience 40))
	(preference (name dresscode) (value ?prefDc))
	(restaurant (name ?nama) (isSmoker ?resSmoker) (minBudget ?resMinB) (maxBudget ?resMaxB) (dresscode ?resDc) (hasWifi ?resWifi))
	?fs <- (restaurantScore (restaurant ?nama) (score ?score))
	?fa <- (attChecked (restaurant ?nama) (name dresscode) (value unchecked))
	=>
	(if (eq 0 (str-compare ?prefDc ?resDc)) then
		(modify ?fs (score(+ 1 ?score)))
		(modify ?fa (value checked))
	)
)

(defrule pickRestaurantMinBudget
	(declare (salience 35))
	(preference (name minBudget) (value ?prefMinB))
	(restaurant (name ?nama) (isSmoker ?resSmoker) (minBudget ?resMinB) (maxBudget ?resMaxB) (dresscode ?resDc) (hasWifi ?resWifi))
	?fs <- (restaurantScore (restaurant ?nama) (score ?score))
	?fa <- (attChecked (restaurant ?nama) (name minBudget) (value unchecked))
	=>
	(if (>= ?prefMinB ?resMinB) then
		(if (<= ?prefMinB ?resMaxB) then
			(modify ?fs (score(+ 1 ?score)))
			(modify ?fa (value checked))
		)
	)
)

(defrule pickRestaurantMinBudget
	(declare (salience 35))
	(preference (name minBudget) (value ?prefMinB))
	(restaurant (name ?nama) (isSmoker ?resSmoker) (minBudget ?resMinB) (maxBudget ?resMaxB) (dresscode ?resDc) (hasWifi ?resWifi))
	?fs <- (restaurantScore (restaurant ?nama) (score ?score))
	?fa <- (attChecked (restaurant ?nama) (name minBudget) (value unchecked))
	=>
	(if (>= ?prefMinB ?resMinB) then
		(if (<= ?prefMinB ?resMaxB) then
			(modify ?fs (score(+ 1 ?score)))
			(modify ?fa (value checked))
		)
	)
)

>>>>>>> 10752603d7477b56b2281b78d20f77e35f2cf6b7
(defrule thankUser
	(declare (salience 5))
	(userinfo(name ?nama))
	=>
	(format t "Thank you, %-12s!%n" ?nama)
)