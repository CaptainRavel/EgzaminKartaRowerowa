extends Control


func _ready():
	pass

func _on_NewTest_pressed():
	get_tree().change_scene_to_packed(load("res://scenes/QuestionScreen.tscn"))

func _on_QuitTest_pressed():
	get_tree().quit()

