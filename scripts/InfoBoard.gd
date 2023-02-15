#InfoBoard.gd
extends TextureRect

func _ready():
	add_to_group("GAME_STATE")
	
func on_game_over():
	$LabelCurrent.text = str(GameData.score)#显示本局成绩
	$LabelRecord.text = str(GameData.load_record())#显示历史最好成绩
#	$AnimationPlayer.play("show")#显示计分板
	set_position(Vector2(194,378))

func on_board_shown():
#	set_process(true)
	get_tree().call_group("GAME_STATE","on_game_start")
	set_position(Vector2(194,1500))
