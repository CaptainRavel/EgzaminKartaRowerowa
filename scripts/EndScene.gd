extends Control

func _ready():
	
	if (GV.czyZaliczone == "TAK"):
		$MarginContainer/VBoxContainer/Label.text = "Udało Ci się zaliczyć test :)"
	elif (GV.czyZaliczone == "NIE"):
		$MarginContainer/VBoxContainer/Label.text = "Niestety nie udało się, \n spróbuj jeszcze raz za jakiś czas"
	
	$MarginContainer/VBoxContainer/Label3.text = str(GV.wynik)+"/25"


func _on_Button_pressed():
	get_tree().quit()


func _on_Button2_pressed():
		get_tree().change_scene_to(load("res://scenes/ScoreScreen.tscn"))
