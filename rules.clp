(defrule opening
	(declare (salience 99))
	=>
	(printout t crlf)
	(printout t "Welcome to Restaurant Recommendation System" crlf)
	(printout t crlf)
)

(defrule questionName
	(declare (salience 95))
	=>
	(printout t "What is your name? ")
	(bind ?response (read))
	 
)

(defrule questionSmoke
	(declare (salience 90))
	=>
	(printout t "Do you smoke? (yes,no) ")
	(bind ?response (read))
	
)

(defrule questionMinBudget
	(declare (salience 85))
	=>
	(printout t "What is your minimum budget? [0-9999] ")
	(bind ?response (read))
	
)

(defrule questionMaxBudget
	(declare (salience 80))
	=>
	(printout t "What is your maximum budget? [0-9999] ")
	(bind ?response (read))
	
)

(defrule questionClothes
	(declare (salience 75))
	=>
	(printout t "What clothes are you wearing? (casual,informal,formal) ")
	(bind ?response (read))
	
)

(defrule questionWifi
	(declare (salience 70))
	=>
	(printout t "Do you want a restaurant with Wi-Fi? (yes/no) ")
	(bind ?response (read))
	
)

	
	
