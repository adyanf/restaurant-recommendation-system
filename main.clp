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
