extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_ScoreArea_body_exited(body):
	
	pass # Replace with function body.


func _on_Area2D_ScoreArea_body_entered(body):
	if(body.name == "Bird"):
		AudioManager.play("sfx_point")#音效
		print("得分")
		GameData.score += 1
		#加分以后通过SceenTree把新的分数更新给所有想接受这个消息的节点
		get_tree().call_group("SCORE","on_score_updated",GameData.score)
	pass # Replace with function body.
