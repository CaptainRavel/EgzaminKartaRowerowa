extends Control

func _ready():
	randomize()
	var qNumber = randi() % 15 + 1
	print(qNumber)
	var qText = "PZ" + str(qNumber)
	var question = tr(qText)
	var firstAnswer = tr(qText+"O1")
	var secondAnswer = tr(qText+"O2")
	var thirdAnswer = tr(qText+"O3")
	
	$MarginContainer1/VBoxContainer/Label2.text = question
	$MarginContainer1/VBoxContainer/TextureRect.texture = load("res://GRAFIKA/ZNAKI/"+qText+".jpg")
	$MarginContainer2/GridContainer/AnswerButton/HBoxContainer/Label2.text = firstAnswer
	$MarginContainer2/GridContainer/AnswerButton2/HBoxContainer/Label2.text = secondAnswer
	$MarginContainer2/GridContainer/AnswerButton3/HBoxContainer/Label2.text = thirdAnswer
	
