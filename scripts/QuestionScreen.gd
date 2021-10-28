extends Control

var questionsCount = 1
var pzQuestionIndex = -1
var poQuestionIndex = 0
var pkQuestionIndex = -1
var pzList = []
var poList = []
var pkList = []
var answer1
var answer2
var answer3
var noneAnswer
var qCat = ""
var answer = ""
var pzAnswers = []
var poAnswers = []
var pkAnswers = []
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
		
	randomize()
	
	GV.db.open_db()
	GV.db.query("SELECT ID FROM uczenInfo WHERE imie = '" + str(GV.imieText) + "' AND nazwisko = '" + str(GV.nazwiskoText) + "' AND klasa = '" + str(GV.klasaText) + "';")
	for i in range(0, GV.db.query_result.size()):
		GV.uczenID = str(GV.db.query_result[i]["ID"])
		print(GV.uczenID)
	if (GV.uczenID == null):
		GV.uczenID = str(GV.imieText).left(3) + str(GV.nazwiskoText).left(3) + str(randi() % 89 + 10)
	print(GV.uczenID)
	
	nextButton.disabled = true
	
	_randomizePOquestions()
	_randomizePZquestions()
	_randomizePKquestions()

	pytanieNumer.text = "Pytanie nr " + str(questionsCount)
	pytanieTresc.text = tr("PO"+str(poList[poQuestionIndex]))
	var file2Check = File.new()
	var doFileExists = file2Check.file_exists("res://graphics/OGOLNE/PO"+str(poList[poQuestionIndex])+".jpg")
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
	
	timer.set_wait_time(GV.pytaniaCzas)
	timer.start()
	
func _process(delta):
	var timeOut = int(timer.get_time_left())
	pozostalyCzas.text = str(timeOut)
	if (timeOut <= 10):
		if !$AudioStreamPlayer.is_playing():
			var CorrectSound = preload("res://sounds/tictac.wav")
			$AudioStreamPlayer.stream = CorrectSound
			$AudioStreamPlayer.play()
		var dynamic_font2 = DynamicFont.new()
		dynamic_font2.font_data = load("res://fonts/droid-sans/DroidSans-Bold.ttf")
		dynamic_font2.size = 40
		pozostalyCzas.set("custom_fonts/font", dynamic_font2)
		pozostalyCzas.add_color_override("font_color", Color.red)
	
func _randomizePZquestions():
	for i in range(1, (GV.znakiIlosc+1)):
		var num = randi() % 108 + 1
		while (num in pzList):
			num = randi() % 108 + 1
		pzList.append(num)
		pzList.sort()
		GV.pzList = pzList
	print(pzList)


func _randomizePOquestions():
	for i in range(1, (GV.ogolneIlosc+1)):
		var num = randi() % 389 + 1
		while (num in poList):
			num = randi() % 389 + 1
		poList.append(num)
		poList.sort()
		GV.poList = poList
	print(poList)
	
	
func _randomizePKquestions():
	for i in range(1, (GV.krzyzowkiIlosc+1)):
		var num = randi() % 203 + 1
		while (num in pkList):
			num = randi() % 203 + 1
		pkList.append(num)
		pkList.sort()
		GV.pkList = pkList
	print(pkList)
	
func _on_NextButton_pressed():
	
	$AudioStreamPlayer.stop()
	
	var dynamic_font1 = DynamicFont.new()
	dynamic_font1.font_data = load("res://fonts/droid-sans/DroidSans.ttf")
	dynamic_font1.size = 30
	pozostalyCzas.set("custom_fonts/font", dynamic_font1)
	pozostalyCzas.add_color_override("font_color", Color.black)
	
	if (answer1 == true):
		if (questionsCount <= GV.ogolneIlosc):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "A"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			poAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (GV.ogolneIlosc + GV.znakiIlosc) and questionsCount > GV.ogolneIlosc):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "A"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			pzAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (GV.ogolneIlosc + GV.znakiIlosc + GV.krzyzowkiIlosc) and questionsCount > (GV.ogolneIlosc + GV.znakiIlosc)):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "A"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			pkAnswers.append(answerKey)
			print(answer)
	elif (answer2 == true):
		if (questionsCount <= GV.ogolneIlosc):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "B"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			poAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (GV.ogolneIlosc + GV.znakiIlosc) and questionsCount > GV.ogolneIlosc):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "B"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			pzAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (GV.ogolneIlosc + GV.znakiIlosc + GV.krzyzowkiIlosc) and questionsCount > (GV.ogolneIlosc + GV.znakiIlosc)):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "B"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			pkAnswers.append(answerKey)
			print(answer)
	elif (answer3 == true):
		if (questionsCount <= GV.ogolneIlosc):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "C"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			poAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (GV.ogolneIlosc + GV.znakiIlosc) and questionsCount > GV.ogolneIlosc):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "C"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			pzAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (GV.ogolneIlosc + GV.znakiIlosc + GV.krzyzowkiIlosc) and questionsCount > (GV.ogolneIlosc + GV.znakiIlosc)):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "C"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			if (answerKey == tr(qCat+"DO")):
				GV.wynik = GV.wynik + 1
			pkAnswers.append(answerKey)
			print(answer)
	elif (noneAnswer == true):
		if (questionsCount <= GV.ogolneIlosc):
			qCat = "PO"+str(poList[poQuestionIndex])
			var answerKey = "BRAK"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			pzAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (GV.ogolneIlosc + GV.znakiIlosc) and questionsCount > GV.ogolneIlosc):
			qCat = "PZ"+str(pzList[pzQuestionIndex])
			var answerKey = "BRAK"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			poAnswers.append(answerKey)
			print(answer)
		elif (questionsCount <= (GV.ogolneIlosc + GV.znakiIlosc + GV.krzyzowkiIlosc) and questionsCount > (GV.ogolneIlosc + GV.znakiIlosc)):
			qCat = "PK"+str(pkList[pkQuestionIndex])
			var answerKey = "BRAK"
			answer = str(questionsCount)+" "+qCat+" "+answerKey
			pkAnswers.append(answerKey)
			print(answer)
		
	_reset_Buttons()

	questionsCount = questionsCount + 1
	
	if (questionsCount <= GV.ogolneIlosc):
		timer.set_wait_time(GV.pytaniaCzas)
		timer.start()
		poQuestionIndex = poQuestionIndex + 1
		pytanieNumer.text = "Pytanie nr " + str(questionsCount)
		pytanieTresc.text = tr("PO"+str(poList[poQuestionIndex]))
		var file2Check = File.new()
		var doFileExists = file2Check.file_exists("res://graphics/OGOLNE/PO"+str(poList[poQuestionIndex])+".jpg")
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
	elif (questionsCount <= (GV.ogolneIlosc + GV.znakiIlosc)):	
		timer.set_wait_time(GV.pytaniaCzas)
		timer.start()
		pzQuestionIndex = pzQuestionIndex + 1
		pytanieNumer.text = "Pytanie nr " + str(questionsCount)
		pytanieTresc.text = tr("PZ"+str(pzList[pzQuestionIndex]))
		pytanieObraz.texture = load("res://graphics/ZNAKI/PZ"+str(pzList[pzQuestionIndex])+".jpg")
		odpATresc.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O1")
		odpBTresc.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O2")
		odpCTresc.text = tr("PZ"+str(pzList[pzQuestionIndex])+"O3")
		return
	elif (questionsCount <= (GV.ogolneIlosc + GV.znakiIlosc + GV.krzyzowkiIlosc)):
		timer.set_wait_time(GV.krzyzowkiCzas)
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
		if (GV.wynik >= (0.75 * GV.pytaniaIlosc)):
			GV.czyZaliczone = "TAK"
		GV.poAnswers = poAnswers
		GV.pzAnswers = pzAnswers
		GV.pkAnswers = pkAnswers
		_commitUczenInfo()
		_commitUczenPytania()
		get_tree().change_scene_to(load("res://scenes/EndScene.tscn"))
	
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
	
func _commitUczenInfo():
	GV.db.open_db()
	var tableName = "uczenInfo"
	var aktualnyWynik = str(GV.wynik) + "/25"
	GV.db.query("INSERT INTO " + tableName + " (ID, imie, nazwisko, klasa, rok_szkolny, data, godzina, wynik, czy_zaliczone) VALUES ('" + str(GV.uczenID) + "','" + str(GV.imieText)
	+ "','" + str(GV.nazwiskoText) + "','" + str(GV.klasaText) + "','" + str(GV.rok_szkolny) + "','" + str(GV.currentDate) + "','" + str(GV.godzina) + "','" 
	+ str(aktualnyWynik) + "','" + str(GV.czyZaliczone) + "')")
	
func _commitUczenPytania():
	GV.db.open_db()
	var tableName = "uczenPytania"
	GV.db.query("INSERT INTO " + tableName + " (uczenID, data, pytania_znaki, pytania_ogolne, pytania_krzyzowki, znaki_odp, ogolne_odp, krzyzowki_odp) VALUES ('" + str(GV.uczenID) + "','" + str(GV.currentDate) + "','" + str(pzList) + "','" + str(poList) + "','" + str(pkList) + "','" + str(pzAnswers) + "','" + str(poAnswers) + "','" + str(pkAnswers) + "')")

	
