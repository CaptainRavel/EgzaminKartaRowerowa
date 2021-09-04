extends Control
var questionsCount = 1
var pzQuestionIndex = 0
var poQuestionIndex = -1
var pkQuestionIndex = -1
var pzList = []
var poList = []
var pkList = []

func _ready():
	
	randomize()
	
	for i in range(1, 11):
		var num = randi() % 50 + 1
		while (num in pzList):
			num = randi() % 50 + 1
		pzList.append(num)
	print(pzList)
	
	for i in range(1, 11):
		var num = randi() % 50 + 1
		while (num in poList):
			num = randi() % 50 + 1
		poList.append(num)
	print(poList)
		
	for i in range(1, 11):
		var num = randi() % 50 + 1
		while (num in pkList):
			num = randi() % 50 + 1
		pkList.append(num)
	print(pkList)
	
	$MarginContainer1/VBoxContainer/Label.text = "Pytanie nr " + str(questionsCount)
	$MarginContainer1/VBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex]))
	$MarginContainer1/VBoxContainer/TextureRect.texture = load("res://GRAFIKA/ZNAKI/PZ"+str(pzList[pzQuestionIndex])+".jpg")
	$MarginContainer2/GridContainer/AnswerButton/HBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O1")
	$MarginContainer2/GridContainer/AnswerButton2/HBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O2")
	$MarginContainer2/GridContainer/AnswerButton3/HBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O3")
	
	
func _on_NextButton_pressed():
	
	questionsCount = questionsCount + 1
	
	if (questionsCount <= 10):	
		pzQuestionIndex = pzQuestionIndex + 1
		$MarginContainer1/VBoxContainer/Label.text = "Pytanie nr " + str(questionsCount)
		$MarginContainer1/VBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex]))
		$MarginContainer1/VBoxContainer/TextureRect.texture = load("res://GRAFIKA/ZNAKI/PZ"+str(pzList[pzQuestionIndex])+".jpg")
		$MarginContainer2/GridContainer/AnswerButton/HBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O1")
		$MarginContainer2/GridContainer/AnswerButton2/HBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O2")
		$MarginContainer2/GridContainer/AnswerButton3/HBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O3")
		return
	elif (questionsCount <= 20):
		poQuestionIndex = poQuestionIndex + 1
		$MarginContainer1/VBoxContainer/Label.text = "Pytanie nr " + str(questionsCount)
		$MarginContainer1/VBoxContainer/Label2.text = tr("PO"+str(poList[poQuestionIndex]))
		$MarginContainer1/VBoxContainer/TextureRect.texture = load("res://GRAFIKA/ZNAKI/PO"+str(poList[poQuestionIndex])+".jpg")
		$MarginContainer2/GridContainer/AnswerButton/HBoxContainer/Label2.text = tr("PO"+str(poList[poQuestionIndex])+"O1")
		$MarginContainer2/GridContainer/AnswerButton2/HBoxContainer/Label2.text = tr("PO"+str(poList[poQuestionIndex])+"O2")
		$MarginContainer2/GridContainer/AnswerButton3/HBoxContainer/Label2.text = tr("PO"+str(poList[poQuestionIndex])+"O3")
		return
	elif (questionsCount <= 30):
		pkQuestionIndex = pkQuestionIndex + 1
		$MarginContainer1/VBoxContainer/Label.text = "Pytanie nr " + str(questionsCount)
		$MarginContainer1/VBoxContainer/Label2.text = tr("PK"+str(pkList[pkQuestionIndex]))
		$MarginContainer1/VBoxContainer/TextureRect.texture = load("res://GRAFIKA/ZNAKI/PK"+str(pkList[pkQuestionIndex])+".jpg")
		$MarginContainer2/GridContainer/AnswerButton/HBoxContainer/Label2.text = tr("PK"+str(pkList[pkQuestionIndex])+"O1")
		$MarginContainer2/GridContainer/AnswerButton2/HBoxContainer/Label2.text = tr("PK"+str(pkList[pkQuestionIndex])+"O2")
		$MarginContainer2/GridContainer/AnswerButton3/HBoxContainer/Label2.text = tr("PK"+str(pkList[pkQuestionIndex])+"O3")
		return
	else:
		return
	

func get_random_numbers(from, to):
	var arr = []
	for i in range(from,to):
		arr.append(i)
	arr.shuffle()
	return arr
