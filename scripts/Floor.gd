extends Sprite

func _ready():
	add_to_group("GAME_STATE")
	
func _process(delta):
	if position.x <= 200.0:
		position.x = 600.0
	position.x += -200.0*delta

func on_game_over():
	set_process(false)



#Floor.gd
#extends Sprite
#
#func _ready():
#	add_to_group("GAME_STATE")
#	material.set_shader_param("speed",0.2) #游戏开始时地面运动速度设为0.2
#
#func on_game_over():
#	material.set_shader_param("speed",0)
