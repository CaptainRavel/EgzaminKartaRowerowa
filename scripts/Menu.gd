extends Control


func _ready():
	pass

func _on_NewTest_pressed():
	get_tree().change_scene_to(load("res://scenes/VeryficationScreen.tscn"))


func _on_QuitTest_pressed():
	get_tree().quit()

