extends Label


func _ready():
	add_to_group("LIFE")
	pass
	
func on_life_updated(life):
	text = "life: " + str(life)
