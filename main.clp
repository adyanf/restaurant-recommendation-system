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

(deftemplate MAIN::restaurantCoordinate
	(slot name)
	(slot latitude)
	(slot longitude)
)

(deftemplate MAIN::userLocation
	(slot latitude)
	(slot longitude)
)

(deftemplate MAIN::locUser
	(slot name)
	(slot value)
)

(deftemplate MAIN::restaurantScore
	(slot restaurant)
	(slot score)
)

(deftemplate MAIN::restaurantResult
	(slot restaurant)
	(slot category)
	(slot distance)
)

(deftemplate MAIN::attChecked
	(slot restaurant)
	(slot name)
	(slot value)
)