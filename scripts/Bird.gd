extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("GAME_STATE")
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		AudioManager.play("sfx_swooshing")#音效
		linear_velocity = Vector2.UP*500#给它一个竖直向上的线性速度
		angular_velocity = -3.0
		
func _physics_process(delta):
	if Input.is_mouse_button_pressed(1):
		AudioManager.play("sfx_swooshing")#音效
		linear_velocity = Vector2.UP*500#给它一个竖直向上的线性速度
		angular_velocity = -3.0
	if rotation_degrees < -30:
		rotation_degrees = -30
		angular_velocity = 0
	if linear_velocity.y > 0.0:
		angular_velocity = 1.5
	pass


func _on_Bird_body_exited(body):
	print("_on_Bird_body_exited")
	
	pass # Replace with function body.

func on_game_over():
	#call_deferred("set_monitoring",false)
	disconnect("body_exited",self,"_on_Bird_body_exited")#得分区域停止触发


func _on_Bird_body_entered(body):
	print("_on_Bird_body_entered")
	if body is StaticBody2D:
		AudioManager.play("sfx_die")#音效
		print("die...")
#		call_deferred("set", "position", Vector2(375.0,500.0))		
#		GameData.life -= 1
#		get_tree().call_group("LIFE","on_life_updated",GameData.life)#调用GAME_STATE的on_game_over方法
#		if(GameData.life<=0):
		call_deferred("set_physics_process",false)#停用_physics_process(delta)
		call_deferred("set_contact_monitor",false)#关闭碰撞检测
		$AnimationPlayer.play("die")#动画切换到死亡状态
		GameData.update_record()#更新最好成绩记录
		get_tree().call_group("GAME_STATE","on_game_over")#调用GAME_STATE的on_game_over方法
	pass # Replace with function body.
