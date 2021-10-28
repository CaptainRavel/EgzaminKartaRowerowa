extends Control

var login = "Arktur"
var haslo = "wolarz1967"
var correctLogin = false
var correctHaslo = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/HBoxContainer/LineEdit.text = ""
	$MarginContainer/HBoxContainer/LineEdit2.text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LineEdit_text_changed(loginText):
	if loginText == login:
		correctLogin = true
	else:
		return


func _on_LineEdit2_text_changed(hasloText):
	if hasloText == haslo:
		correctHaslo = true
	else:
		return


func _on_Button_pressed():
	if correctLogin == true and correctHaslo == true:
		get_tree().change_scene_to(load("res://scenes/StatisticsScreen.tscn"))
	else:
		$MarginContainer/HBoxContainer/Label.text = "NIEPOPRAWNY LOGIN/HASŁO!"

func _on_Button2_pressed():
	get_tree().change_scene_to(load("res://scenes/Menu.tscn"))
