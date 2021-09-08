extends Control

const SQLite = preload("res://ADDONS/godot-sqlite/bin/gdsqlite.gdns")

var questionsCount = 1
var pzQuestionIndex = 0
var poQuestionIndex = -1
var pkQuestionIndex = -1
var pzList = []
var poList = []
var pkList = []
var qCat = ""
var answer = ""
var pzAnswers = []
var poAnswers = []
var pkAnswers = []
var db
var db_name = "res://DATABASE/database"

func _ready():
	randomize()
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	db.query("SELECT ID FROM uczenInfo WHERE imie = '" + str(GV.imieText) + "' AND nazwisko = '" + str(GV.nazwiskoText) + "' AND klasa = '" + str(GV.klasaText) + "';")
	for i in range(0, db.query_result.size()):
		GV.uczenID = str(db.query_result[i]["ID"])
		print(GV.uczenID)
	if (GV.uczenID == null):
		GV.uczenID = str(GV.imieText).left(3) + str(GV.nazwiskoText).left(3) + str(randi() % 89 + 10)
	print(GV.uczenID)
	$MarginContainer2/GridContainer/NextButton.disabled = true
	
	_randomizePZquestions()
	_randomizePOquestions()
	_randomizePKquestions()

	$MarginContainer1/VBoxContainer/Label.text = "Pytanie nr " + str(questionsCount)
	$MarginContainer1/VBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex]))
	$MarginContainer1/VBoxContainer/TextureRect.texture = load("res://GRAFIKA/ZNAKI/PZ"+str(pzList[pzQuestionIndex])+".jpg")
	$MarginContainer2/GridContainer/AnswerButton/HBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O1")
	$MarginContainer2/GridContainer/AnswerButton2/HBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O2")
	$MarginContainer2/GridContainer/AnswerButton3/HBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O3")
	
	$MarginContainer1/VBoxContainer/Timer.set_wait_time(30)
	$MarginContainer1/VBoxContainer/Timer.start()
	
func _process(delta):
	var timeOut = int($MarginContainer1/VBoxContainer/Timer.get_time_left())
	$MarginContainer1/VBoxContainer/Label3.text = "Pozostały czas: " + str(timeOut) + "s."
	
func _randomizePZquestions():
	for i in range(1, 11):
		var num = randi() % 108 + 1
		while (num in pzList):
			num = randi() % 108 + 1
		pzList.append(num)
		pzList.sort()
	print(pzList)


func _randomizePOquestions():
	for i in range(1, 6):
		var num = randi() % 10 + 1
		while (num in poList):
			num = randi() % 10 + 1
		poList.append(num)
		poList.sort()
	print(poList)
	
	
func _randomizePKquestions():
	for i in range(1, 6):
		var num = randi() % 203 + 1
		while (num in pkList):
			num = randi() % 203 + 1
		pkList.append(num)
		pkList.sort()
	print(pkList)
	
func _on_NextButton_pressed():
	if ($MarginContainer2/GridContainer/AnswerButton.disabled == true):
		if (questionsCount <= 10):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "A"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			pzAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= 15):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "A"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			poAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= 20):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "A"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			pkAnswers.append(answerKey)
			print(answer)
	elif ($MarginContainer2/GridContainer/AnswerButton2.disabled == true):
		if (questionsCount <= 10):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "B"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			pzAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= 15):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "B"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			poAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= 20):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "B"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			pkAnswers.append(answerKey)
			print(answer)
	elif ($MarginContainer2/GridContainer/AnswerButton3.disabled == true):
		if (questionsCount <= 10):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "C"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			pzAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= 15):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "C"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			poAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= 20):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "C"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			pkAnswers.append(answerKey)
			print(answer)
	elif ($MarginContainer2/GridContainer/AnswerButton.disabled == false and $MarginContainer2/GridContainer/AnswerButton2.disabled == false and $MarginContainer2/GridContainer/AnswerButton3.disabled == false):
		if (questionsCount <= 10):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "BRAK"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			pzAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= 15):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "BRAK"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			poAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= 20):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "BRAK"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			pkAnswers.append(answerKey)
			print(answer)
		
	$MarginContainer2/GridContainer/NextButton.disabled = true
	$MarginContainer2/GridContainer/AnswerButton.disabled = false
	$MarginContainer2/GridContainer/AnswerButton2.disabled = false
	$MarginContainer2/GridContainer/AnswerButton3.disabled = false
	questionsCount = questionsCount + 1
	
	$MarginContainer1/VBoxContainer/Timer.set_wait_time(30)
	$MarginContainer1/VBoxContainer/Timer.start()
	
	if (questionsCount <= 10):	
		pzQuestionIndex = pzQuestionIndex + 1
		$MarginContainer1/VBoxContainer/Label.text = "Pytanie nr " + str(questionsCount)
		$MarginContainer1/VBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex]))
		$MarginContainer1/VBoxContainer/TextureRect.texture = load("res://GRAFIKA/ZNAKI/PZ"+str(pzList[pzQuestionIndex])+".jpg")
		$MarginContainer2/GridContainer/AnswerButton/HBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O1")
		$MarginContainer2/GridContainer/AnswerButton2/HBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O2")
		$MarginContainer2/GridContainer/AnswerButton3/HBoxContainer/Label2.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O3")
		return
	elif (questionsCount <= 15):
		poQuestionIndex = poQuestionIndex + 1
		$MarginContainer1/VBoxContainer/Label.text = "Pytanie nr " + str(questionsCount)
		$MarginContainer1/VBoxContainer/Label2.text = tr("PO"+str(poList[poQuestionIndex]))
		var file2Check = File.new()
		var doFileExists = file2Check.file_exists("res://GRAFIKA/OGOLNE/PO"+str(poList[poQuestionIndex])+".jpg")
		if (doFileExists == true):
			$MarginContainer1/VBoxContainer/TextureRect.texture = load("res://GRAFIKA/OGOLNE/PO"+str(poList[poQuestionIndex])+".jpg")
			$MarginContainer2/GridContainer/AnswerButton/HBoxContainer/Label2.text = tr("PO"+str(poList[poQuestionIndex])+"O1")
			$MarginContainer2/GridContainer/AnswerButton2/HBoxContainer/Label2.text = tr("PO"+str(poList[poQuestionIndex])+"O2")
			$MarginContainer2/GridContainer/AnswerButton3/HBoxContainer/Label2.text = tr("PO"+str(poList[poQuestionIndex])+"O3")
		else:
			$MarginContainer1/VBoxContainer/TextureRect.texture = null
			$MarginContainer2/GridContainer/AnswerButton/HBoxContainer/Label2.text = tr("PO"+str(poList[poQuestionIndex])+"O1")
			$MarginContainer2/GridContainer/AnswerButton2/HBoxContainer/Label2.text = tr("PO"+str(poList[poQuestionIndex])+"O2")
			$MarginContainer2/GridContainer/AnswerButton3/HBoxContainer/Label2.text = tr("PO"+str(poList[poQuestionIndex])+"O3")
		return
	elif (questionsCount <= 20):
		pkQuestionIndex = pkQuestionIndex + 1
		$MarginContainer1/VBoxContainer/Label.text = "Pytanie nr " + str(questionsCount)
		$MarginContainer1/VBoxContainer/Label2.text = tr("PK"+str(pkList[pkQuestionIndex]))
		$MarginContainer1/VBoxContainer/TextureRect.texture = load("res://GRAFIKA/KRZYZOWKI/PK"+str(pkList[pkQuestionIndex])+".jpg")
		$MarginContainer2/GridContainer/AnswerButton/HBoxContainer/Label2.text = tr("PK"+str(pkList[pkQuestionIndex])+"O1")
		$MarginContainer2/GridContainer/AnswerButton2/HBoxContainer/Label2.text = tr("PK"+str(pkList[pkQuestionIndex])+"O2")
		$MarginContainer2/GridContainer/AnswerButton3/HBoxContainer/Label2.text = tr("PK"+str(pkList[pkQuestionIndex])+"O3")
		return
	else:
		if (GV.wynik >= 15):
			GV.czyZaliczone = "TAK"
		_commitUczenInfo()
		_commitUczenPytania()
		get_tree().change_scene_to(load("res://SCENY/EndScene.tscn"))
	
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

func _commitUczenInfo():
	db.open_db()
	var tableName = "uczenInfo"
	db.query("INSERT INTO " + tableName + " (ID, imie, nazwisko, klasa, data, wynik, zaliczone) VALUES ('" + str(GV.uczenID) + "','" + str(GV.imieText) + "','" + str(GV.nazwiskoText) + "','" + str(GV.klasaText) + "','" + str(GV.currentDate) + "','" 
	 + str(GV.wynik) + "','" + str(GV.czyZaliczone) + "')")
	
func _commitUczenPytania():
	db.open_db()
	var tableName = "uczenPytania"
	db.query("INSERT INTO " + tableName + " (uczenID, data, pytania_znaki, pytania_ogolne, pytania_krzyzowki, znaki_odp, ogolne_odp, krzyzowki_odp) VALUES ('" + str(GV.uczenID) + "','" + str(GV.currentDate) + "','" + str(pzList) + "','" + str(poList) + "','" + str(pkList) + "','" + str(pzAnswers) + "','" + str(poAnswers) + "','" + str(pkAnswers) + "')")


func _on_Timer_timeout():
	_on_NextButton_pressed()
