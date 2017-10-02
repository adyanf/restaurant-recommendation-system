(deftemplate MAIN::restaurant
	(slot name)
	(slot isSmoker)
	(slot minBudget)
	(slot maxBudget)
	(multislot dresscode)
	(slot hasWifi)
)

(deftemplate MAIN::preference
	(slot name)
	(multislot value)
)

(deftemplate MAIN::userinfo
	(slot name)
)

(deftemplate MAIN::printed
	(slot count)
)

(deftemplate MAIN::restaurantDistance
	(slot name)
	(slot latitude)
	(slot longitude)
)

(deftemplate MAIN::restaurantScore
	(slot restaurant)
	(slot score)
)

(deftemplate MAIN::restaurantCategory
	(slot restaurant)
	(slot category)
)

(deftemplate MAIN::attChecked
	(slot restaurant)
	(slot name)
	(slot value)
)