(defrule opening
	(declare (salience 99))
	=>
	(printout t crlf)
	(printout t "Welcome to Restaurant Recommendation System" crlf)
	(printout t crlf)
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
	(assert (preference (name minbudget) (value ?response)))
)

(defrule questionMaxBudget
	(declare (salience 80))
	=>
	(printout t "What is your maximum budget? [0-9999] ")
	(bind ?response (read))
	(assert (preference (name maxbudget) (value ?response)))
)

(defrule questionClothes
	(declare (salience 75))
	=>
	(printout t "What clothes are you wearing? (casual,informal,formal) ")
	(bind ?response (read))
	(assert (preference (name clothes) (value ?response)))
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

(defrule thankUser
	(declare (salience 5))
	(userinfo(name ?nama))
	=>
	(format t "Thank you, %-12s %n" ?nama)
)
