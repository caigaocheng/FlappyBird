extends Label

func _ready():
	add_to_group("SCORE")
	pass
	
func on_score_updated(score):
	text = "score: " + str(score)
