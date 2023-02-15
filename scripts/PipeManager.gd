extends Node

var timerTask
var pipe_scn = preload("res://Objects/Pipe.tscn")
var count = 90
var index = 0
func _ready():
	add_to_group("GAME_STATE")#加入GAME_STATE组
#	createTimer()
	pass # Replace with function body.

func createTimer():
	timerTask = Timer.new()
	timerTask.wait_time = 1.5
	timerTask.connect("timeout", self, "_on_PipeManager_timeout")
	add_child(timerTask)
	timerTask.start()
	pass


func _on_PipeManager_timeout():
	count = 90 + rand_range(-20,30)
	var pipe = pipe_scn.instance()
	add_child(pipe)
	pass # Replace with function body.

func on_game_over():
	set_process(false)
#	timerTask.paused = true#停止计时

func _process(delta):
	index+=1
	if(index > count):
		index = 0
		_on_PipeManager_timeout()
	pass
