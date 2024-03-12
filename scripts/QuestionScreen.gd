extends Control

var czyZaliczone = "NIE"
var pzQuestionIndex = -1
var questionsCount = 1
var poQuestionIndex = 0
var pkQuestionIndex = -1
var pzList = []
var poList = []
var pkList = []
var wynik = 0.0
var iloscPkt 
var pytaniaCzas = 30
var krzyzowkiCzas = 60
var ogolneIlosc = 10
var znakiIlosc  = 10
var krzyzowkiIlosc = 10
var pytaniaIlosc
var poAnswers = []
var pzAnswers = []
var pkAnswers = []
var answer1
var answer2
var answer3
var noneAnswer
var qCat = ""
var answer = ""
var nextButton
var pytanieNumer
var pytanieTresc
var pytanieObraz
var odpAButton
var odpBButton
var odpCButton
var odpATresc
var odpBTresc
var odpCTresc
var timer
var pozostalyCzas
var doFileExists

func _ready():
	
	nextButton = get_node("Margin/HBoxContainer/VBoxContainer/Answers/NextButton")
	pytanieNumer = get_node("Margin/HBoxContainer/VBoxContainer/Questions/QuestionNumberLabel")
	pytanieTresc = get_node("Margin/HBoxContainer/VBoxContainer/Questions/QuestionText")
	pytanieObraz = get_node("Margin/HBoxContainer/VBoxContainer/Questions/QuestionImage")
	odpAButton = get_node("Margin/HBoxContainer/VBoxContainer/Answers/AnswerButton")
	odpBButton = get_node("Margin/HBoxContainer/VBoxContainer/Answers/AnswerButton2")
	odpCButton = get_node("Margin/HBoxContainer/VBoxContainer/Answers/AnswerButton3")
	odpATresc = get_node("Margin/HBoxContainer/VBoxContainer/Answers/AnswerButton/HBoxContainer/Label2")
	odpBTresc = get_node("Margin/HBoxContainer/VBoxContainer/Answers/AnswerButton2/HBoxContainer/Label2")
	odpCTresc = get_node("Margin/HBoxContainer/VBoxContainer/Answers/AnswerButton3/HBoxContainer/Label2")
	timer = get_node("Margin/HBoxContainer/VBoxContainer/Questions/Timer")
	pozostalyCzas = get_node("Margin/HBoxContainer/VBoxContainer/Questions/HBoxContainer/Label4")
	
	answer1 = false
	answer2 = false
	answer3 = false
	noneAnswer = false
		
	nextButton.disabled = true
	
	_randomizePOquestions()
	_randomizePZquestions()
	_randomizePKquestions()
	
	pytaniaIlosc = float(ogolneIlosc + znakiIlosc + krzyzowkiIlosc)
	pytanieNumer.text = "Pytanie nr " + str(questionsCount)
	pytanieTresc.text = tr("PO"+str(poList[poQuestionIndex]))
	doFileExists = FileAccess.file_exists("res://graphics/OGOLNE/PO"+str(poList[poQuestionIndex])+".jpg")
	if (doFileExists == true):
		pytanieObraz.texture = load("res://graphics/OGOLNE/PO"+str(poList[poQuestionIndex])+".jpg")
		odpATresc.text = tr("PO"+str(poList[poQuestionIndex])+"O1")
		odpBTresc.text = tr("PO"+str(poList[poQuestionIndex])+"O2")
		odpCTresc.text = tr("PO"+str(poList[poQuestionIndex])+"O3")
	else:
		pytanieObraz.texture = null
		odpATresc.text = tr("PO"+str(poList[poQuestionIndex])+"O1")
		odpBTresc.text = tr("PO"+str(poList[poQuestionIndex])+"O2")
		odpCTresc.text = tr("PO"+str(poList[poQuestionIndex])+"O3")
	
	timer.set_wait_time(pytaniaCzas)
	timer.start()
	
func _process(_delta):
	var timeOut = int(timer.get_time_left())
	pozostalyCzas.text = str(timeOut)
	if (timeOut <= 10):
		if !$AudioStreamPlayer.is_playing():
			var CorrectSound = preload("res://sounds/tictac.wav")
			$AudioStreamPlayer.stream = CorrectSound
			$AudioStreamPlayer.play()
	
func _randomizePZquestions():
	for i in range(1, (znakiIlosc+1)):
		var num = randi() % 108 + 1
		while (num in pzList):
			num = randi() % 108 + 1
		pzList.append(num)
		pzList.sort()
		GV.pzList = pzList
	print(pzList)

func _randomizePOquestions():
	for i in range(1, (ogolneIlosc+1)):
		var num = randi() % 389 + 1
		while (num in poList):
			num = randi() % 389 + 1
		poList.append(num)
		poList.sort()
		GV.poList = poList
	print(poList)
	
func _randomizePKquestions():
	for i in range(1, (krzyzowkiIlosc+1)):
		var num = randi() % 203 + 1
		while (num in pkList):
			num = randi() % 203 + 1
		pkList.append(num)
		pkList.sort()
		GV.pkList = pkList
	print(pkList)
	
func _on_NextButton_pressed():	
	$AudioStreamPlayer.stop()
	
	if (answer1 == true):
		if (questionsCount <= ogolneIlosc):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "A"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				wynik += 1
			poAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (ogolneIlosc + znakiIlosc) and questionsCount > ogolneIlosc):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "A"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				wynik += 1
			pzAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (ogolneIlosc + znakiIlosc + krzyzowkiIlosc) and questionsCount > (ogolneIlosc + znakiIlosc)):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "A"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				wynik += 1
			pkAnswers.append(answerKey)
			print(answer)
	elif (answer2 == true):
		if (questionsCount <= ogolneIlosc):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "B"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				wynik += 1
			poAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (ogolneIlosc + znakiIlosc) and questionsCount > ogolneIlosc):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "B"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				wynik += 1
			pzAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (ogolneIlosc + znakiIlosc + krzyzowkiIlosc) and questionsCount > (ogolneIlosc + znakiIlosc)):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "B"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				wynik += 1
			pkAnswers.append(answerKey)
			print(answer)
	elif (answer3 == true):
		if (questionsCount <= ogolneIlosc):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "C"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				wynik += 1
			poAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (ogolneIlosc + znakiIlosc) and questionsCount > ogolneIlosc):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "C"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				wynik += 1
			pzAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (ogolneIlosc + znakiIlosc + krzyzowkiIlosc) and questionsCount > (ogolneIlosc + znakiIlosc)):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "C"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				wynik += 1
			pkAnswers.append(answerKey)
			print(answer)
	elif (noneAnswer == true):
		if (questionsCount <= ogolneIlosc):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "BRAK"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			pzAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (ogolneIlosc + znakiIlosc) and questionsCount > ogolneIlosc):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "BRAK"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			poAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (ogolneIlosc + znakiIlosc + krzyzowkiIlosc) and questionsCount > (ogolneIlosc + znakiIlosc)):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "BRAK"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			pkAnswers.append(answerKey)
			print(answer)
	_reset_Buttons()

	questionsCount += 1
	
	if (questionsCount <= ogolneIlosc):
		timer.set_wait_time(pytaniaCzas)
		timer.start()
		poQuestionIndex = poQuestionIndex + 1
		pytanieNumer.text = "Pytanie nr " + str(questionsCount)
		pytanieTresc.text = tr("PO"+str(poList[poQuestionIndex]))
		doFileExists = FileAccess.file_exists("res://graphics/OGOLNE/PO"+str(poList[poQuestionIndex])+".jpg")
		if (doFileExists == true):
			pytanieObraz.texture = load("res://graphics/OGOLNE/PO"+str(poList[poQuestionIndex])+".jpg")
			odpATresc.text = tr("PO"+str(poList[poQuestionIndex])+"O1")
			odpBTresc.text = tr("PO"+str(poList[poQuestionIndex])+"O2")
			odpCTresc.text = tr("PO"+str(poList[poQuestionIndex])+"O3")
		else:
			pytanieObraz.texture = null
			odpATresc.text = tr("PO"+str(poList[poQuestionIndex])+"O1")
			odpBTresc.text = tr("PO"+str(poList[poQuestionIndex])+"O2")
			odpCTresc.text = tr("PO"+str(poList[poQuestionIndex])+"O3")
		return
	elif (questionsCount <= (ogolneIlosc + znakiIlosc)):	
		timer.set_wait_time(pytaniaCzas)
		timer.start()
		pzQuestionIndex = pzQuestionIndex + 1
		pytanieNumer.text = "Pytanie nr " + str(questionsCount)
		pytanieTresc.text = tr("PZ"+str(pzList[pzQuestionIndex]))
		pytanieObraz.texture = load("res://graphics/ZNAKI/PZ"+str(pzList[pzQuestionIndex])+".jpg")
		odpATresc.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O1")
		odpBTresc.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O2")
		odpCTresc.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O3")
		return
	elif (questionsCount <= (ogolneIlosc + znakiIlosc + krzyzowkiIlosc)):
		timer.set_wait_time(krzyzowkiCzas)
		timer.start()
		pkQuestionIndex = pkQuestionIndex + 1
		pytanieNumer.text = "Pytanie nr " + str(questionsCount)
		pytanieTresc.text = tr("PK"+str(pkList[pkQuestionIndex]))
		pytanieObraz.texture = load("res://graphics/KRZYZOWKI/PK"+str(pkList[pkQuestionIndex])+".jpg")
		odpATresc.text = tr("PK"+str(pkList[pkQuestionIndex])+"O1")
		odpBTresc.text = tr("PK"+str(pkList[pkQuestionIndex])+"O2")
		odpCTresc.text = tr("PK"+str(pkList[pkQuestionIndex])+"O3")
		return
	else:
		if (wynik >= (0.75 * pytaniaIlosc)):
			czyZaliczone = "TAK"
	GV.poAnswers = poAnswers
	GV.pzAnswers = pzAnswers
	GV.pkAnswers = pkAnswers
	print(poAnswers)
	print(pzAnswers)
	print(pkAnswers)
	iloscPkt = ogolneIlosc + znakiIlosc + krzyzowkiIlosc
	GV.iloscPkt = iloscPkt
	GV.wynik = wynik
	GV.czyZaliczone = czyZaliczone
	get_tree().change_scene_to_packed(load("res://scenes/EndScene.tscn"))
	
func _on_AnswerButton_pressed():
	answer1 = true
	odpAButton.disabled = true
	odpBButton.disabled = false
	odpCButton.disabled = false
	nextButton.disabled = false


func _on_AnswerButton2_pressed():
	answer2 = true
	odpBButton.disabled = true
	odpAButton.disabled = false
	odpCButton.disabled = false
	nextButton.disabled = false

func _on_AnswerButton3_pressed():
	answer3 = true
	odpCButton.disabled = true
	odpAButton.disabled = false
	odpBButton.disabled = false
	nextButton.disabled = false

func _on_Timer_timeout():
	noneAnswer = true
	_on_NextButton_pressed()
	
func _reset_Buttons():
	nextButton.disabled = true
	odpAButton.disabled = false
	odpBButton.disabled = false
	odpCButton.disabled = false
	
	odpAButton.release_focus()
	odpBButton.release_focus()
	odpCButton.release_focus()
	
	answer1 = false
	answer2 = false
	answer3 = false
	noneAnswer = false


func _on_exit_button_pressed():
	get_tree().quit()
