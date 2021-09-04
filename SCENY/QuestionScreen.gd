extends Control
var questionsCount = 1
var pzQuestionIndex = 0
var poQuestionIndex = -1
var pkQuestionIndex = -1
var pzList = []
var poList = []
var pkList = []
var qCat = ""
var answer = ""

func _ready():
	$MarginContainer2/GridContainer/NextButton.disabled = true
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
	
func _process(delta):
	pass

func _on_NextButton_pressed():
	if ($MarginContainer2/GridContainer/AnswerButton.disabled == true):
		if (questionsCount <= 10):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "A"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			print(answer)
		elif (questionsCount <= 20):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "A"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			print(answer)
		elif (questionsCount <= 20):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "A"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			print(answer)
	elif ($MarginContainer2/GridContainer/AnswerButton2.disabled == true):
		if (questionsCount <= 10):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "B"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			print(answer)
		elif (questionsCount <= 20):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "B"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			print(answer)
		elif (questionsCount <= 20):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "B"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			print(answer)
	elif ($MarginContainer2/GridContainer/AnswerButton3.disabled == true):
		if (questionsCount <= 10):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "C"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			print(answer)
		elif (questionsCount <= 20):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "C"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			print(answer)
		elif (questionsCount <= 20):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "C"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			print(answer)
		
	$MarginContainer2/GridContainer/NextButton.disabled = true
	$MarginContainer2/GridContainer/AnswerButton.disabled = false
	$MarginContainer2/GridContainer/AnswerButton2.disabled = false
	$MarginContainer2/GridContainer/AnswerButton3.disabled = false
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


func _on_AnswerButton_pressed():
	$MarginContainer2/GridContainer/AnswerButton.disabled = true
	$MarginContainer2/GridContainer/AnswerButton2.disabled = false
	$MarginContainer2/GridContainer/AnswerButton3.disabled = false
	$MarginContainer2/GridContainer/NextButton.disabled = false


func _on_AnswerButton2_pressed():
	$MarginContainer2/GridContainer/AnswerButton2.disabled = true
	$MarginContainer2/GridContainer/AnswerButton.disabled = false
	$MarginContainer2/GridContainer/AnswerButton3.disabled = false
	$MarginContainer2/GridContainer/NextButton.disabled = false

func _on_AnswerButton3_pressed():
	$MarginContainer2/GridContainer/AnswerButton3.disabled = true
	$MarginContainer2/GridContainer/AnswerButton.disabled = false
	$MarginContainer2/GridContainer/AnswerButton2.disabled = false
	$MarginContainer2/GridContainer/NextButton.disabled = false


