#GameData.gd
extends Node
#非加密版本
var score = 0
var life = 10
func update_record():
	if score > load_record():
		FileHelper.save("user://record.res",score)

func load_record():
	return  FileHelper.read("user://record.res",0)

#加密版本
#var score = 0
#
#func update_record():
#	if score > load_record():
#		FileHelper.save_encrypted("user://record.res",score,OS.get_unique_id())
#
#func load_record():
#	return FileHelper.read_encrypted("user://record.res",OS.get_unique_id(),0)
