(deftemplate MAIN::restaurant
	(slot name)
	(slot isSmoker)
	(slot minBudget)
	(slot maxBudget)
	(slot dresscode)
	(slot hasWifi)
)

(deftemplate MAIN::preference
	(slot name)
	(multislot value)
)

(deftemplate MAIN::userinfo
	(slot name)
)

(deftemplate MAIN::restaurantScore
	(slot restaurant)
	(slot score)
)

(deftemplate MAIN::attChecked
	(slot restaurant)
	(slot name)
	(slot value)
)