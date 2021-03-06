extends Control

var questionsCount = 1
var pzQuestionIndex = -1
var poQuestionIndex = 0
var pkQuestionIndex = -1
var poAnswersIndex = 0
var pzAnswersIndex = -1
var pkAnswersIndex = -1
var prevButton
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
var twojaOdp
var poprawnaOdp
var czyPoprawna
var qCat
var dynamic_font

func _ready():

	dynamic_font =  DynamicFont.new()
	dynamic_font.font_data = load("res://fonts/droid-sans/DroidSans-Bold.ttf")
	dynamic_font.size = 30
	nextButton = get_node("Margin/HBoxContainer/VBoxContainer/Answers/HBoxContainer/NextButton")
	prevButton = get_node("Margin/HBoxContainer/VBoxContainer/Answers/HBoxContainer/PrevButton")
	pytanieNumer = get_node("Margin/HBoxContainer/VBoxContainer/Questions/Label")
	pytanieTresc = get_node("Margin/HBoxContainer/VBoxContainer/Questions/Label2")
	pytanieObraz = get_node("Margin/HBoxContainer/VBoxContainer/Questions/TextureRect")
	odpAButton = get_node("Margin/HBoxContainer/VBoxContainer/Answers/AnswerButton")
	odpBButton = get_node("Margin/HBoxContainer/VBoxContainer/Answers/AnswerButton2")
	odpCButton = get_node("Margin/HBoxContainer/VBoxContainer/Answers/AnswerButton3")
	odpATresc = get_node("Margin/HBoxContainer/VBoxContainer/Answers/AnswerButton/HBoxContainer/Label2")
	odpBTresc = get_node("Margin/HBoxContainer/VBoxContainer/Answers/AnswerButton2/HBoxContainer/Label2")
	odpCTresc = get_node("Margin/HBoxContainer/VBoxContainer/Answers/AnswerButton3/HBoxContainer/Label2")
	czyPoprawna = get_node("Margin/HBoxContainer/VBoxContainer/Answers/Label")
	twojaOdp = get_node("Margin/HBoxContainer/VBoxContainer/Answers/HBoxContainer2/Label2")
	poprawnaOdp = get_node("Margin/HBoxContainer/VBoxContainer/Answers/HBoxContainer2/Label3")
	
	odpAButton.color = Color.webgray
	odpBButton.color = Color.webgray
	odpCButton.color = Color.webgray
	prevButton.disabled = true
	
	pytanieNumer.text = "Pytanie nr " + str(questionsCount)
	pytanieTresc.text = tr("PO"+str(GV.poList[poQuestionIndex]))
	var file2Check = File.new()
	var doFileExists = file2Check.file_exists("res://graphics/OGOLNE/PO"+str(GV.poList[poQuestionIndex])+".jpg")
	if (doFileExists == true):
		pytanieObraz.texture = load("res://graphics/OGOLNE/PO"+str(GV.poList[poQuestionIndex])+".jpg")
		odpATresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O1")
		odpBTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O2")
		odpCTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O3")
	else:
		pytanieObraz.texture = null
		odpATresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O1")
		odpBTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O2")
		odpCTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O3")
	
	qCat = "PO" + str(GV.poList[poQuestionIndex])
	twojaOdp.text = "Twoja odpowied??: " + str(GV.poAnswers[poAnswersIndex])
	poprawnaOdp.text = "Poprawna odpowied??: " + str(tr(qCat+"DO"))
	if (str(GV.poAnswers[poAnswersIndex]) == tr(qCat+"DO")):
		czyPoprawna.text = "ODPOWIEDZIA??E?? PRAWID??OWO"
		czyPoprawna.set("custom_fonts/font", dynamic_font)
		czyPoprawna.add_color_override("font_color", Color.green)
	else:
		czyPoprawna.text = "ODPOWIEDZIA??E?? NIEPRAWID??OWO"
		czyPoprawna.set("custom_fonts/font", dynamic_font)
		czyPoprawna.add_color_override("font_color", Color.red)
		
	if (str(GV.poAnswers[poAnswersIndex]) == "A"):
		odpAButton.color = Color.darkred
	if (str(GV.poAnswers[poAnswersIndex]) == "B"):
		odpBButton.color = Color.darkred
	if (str(GV.poAnswers[poAnswersIndex]) == "C"):
		odpCButton.color = Color.darkred
	if (str(GV.poAnswers[poAnswersIndex]) == "BRAK"):
		odpAButton.color = Color.darkred
		odpBButton.color = Color.darkred
		odpCButton.color = Color.darkred
		
	if(tr(qCat+"DO") == "A"):
		odpAButton.color = Color.darkgreen
	if(tr(qCat+"DO") == "B"):
		odpBButton.color = Color.darkgreen
	if(tr(qCat+"DO") == "C"):
		odpCButton.color = Color.darkgreen

func _on_NextButton_pressed():
	
	prevButton.disabled =false
	odpAButton.color = Color.webgray
	odpBButton.color = Color.webgray
	odpCButton.color = Color.webgray
		
	if (questionsCount > 0 and questionsCount <= GV.pytaniaIlosc):
		questionsCount = questionsCount + 1	
		if (questionsCount > 0 and questionsCount <= GV.ogolneIlosc):
			poQuestionIndex = poQuestionIndex + 1
			print(poQuestionIndex)
			pytanieNumer.text = "Pytanie nr " + str(questionsCount)
			pytanieTresc.text = tr("PO"+str(GV.poList[poQuestionIndex]))
			var file2Check = File.new()
			var doFileExists = file2Check.file_exists("res://graphics/OGOLNE/PO"+str(GV.poList[poQuestionIndex])+".jpg")
			if (doFileExists == true):
				pytanieObraz.texture = load("res://graphics/OGOLNE/PO"+str(GV.poList[poQuestionIndex])+".jpg")
				odpATresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O1")
				odpBTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O2")
				odpCTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O3")
			else:
				pytanieObraz.texture = null
				odpATresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O1")
				odpBTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O2")
				odpCTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O3")
				
			poAnswersIndex = poAnswersIndex + 1	
			print(poAnswersIndex)
			
			qCat = "PO" + str(GV.poList[poQuestionIndex])
			twojaOdp.text = "Twoja odpowied??: " + str(GV.poAnswers[poAnswersIndex])
			poprawnaOdp.text = "Poprawna odpowied??: " + str(tr(qCat+"DO"))
			if (str(GV.poAnswers[poAnswersIndex]) == tr(qCat+"DO")):
				czyPoprawna.text = "ODPOWIEDZIA??E?? PRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.green)
			else:
				czyPoprawna.text = "ODPOWIEDZIA??E?? NIEPRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.red)
		
			if (str(GV.poAnswers[poAnswersIndex]) == "A"):
				odpAButton.color = Color.darkred
			if (str(GV.poAnswers[poAnswersIndex]) == "B"):
				odpBButton.color = Color.darkred
			if (str(GV.poAnswers[poAnswersIndex]) == "C"):
				odpCButton.color = Color.darkred
			if (str(GV.poAnswers[poAnswersIndex]) == "BRAK"):
				odpAButton.color = Color.darkred
				odpBButton.color = Color.darkred
				odpCButton.color = Color.darkred
		
			if(tr(qCat+"DO") == "A"):
				odpAButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "B"):
				odpBButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "C"):
				odpCButton.color = Color.darkgreen
			return
		elif (questionsCount == (GV.ogolneIlosc+1)):	
			pzQuestionIndex = 0
			print(pzQuestionIndex)
			pytanieNumer.text = "Pytanie nr " + str(questionsCount)
			pytanieTresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex]))
			pytanieObraz.texture = load("res://graphics/ZNAKI/PZ"+str(GV.pzList[pzQuestionIndex])+".jpg")
			odpATresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex])+"O1")
			odpBTresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex])+"O2")
			odpCTresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex])+"O3")
			
			pzAnswersIndex = 0	
			print(pzAnswersIndex)
			qCat = "PZ" + str(GV.pzList[pzQuestionIndex])
			twojaOdp.text = "Twoja odpowied??: " + str(GV.pzAnswers[pzAnswersIndex])
			poprawnaOdp.text = "Poprawna odpowied??: " + str(tr(qCat+"DO"))
			if (str(GV.pzAnswers[pzAnswersIndex]) == tr(qCat+"DO")):
				czyPoprawna.text = "ODPOWIEDZIA??E?? PRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.green)
			else:
				czyPoprawna.text = "ODPOWIEDZIA??E?? NIEPRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.red)
		
			if (str(GV.pzAnswers[pzAnswersIndex]) == "A"):
				odpAButton.color = Color.darkred
			if (str(GV.pzAnswers[pzAnswersIndex]) == "B"):
				odpBButton.color = Color.darkred
			if (str(GV.pzAnswers[pzAnswersIndex]) == "C"):
				odpCButton.color = Color.darkred
			if (str(GV.pzAnswers[pzAnswersIndex]) == "BRAK"):
				odpAButton.color = Color.darkred
				odpBButton.color = Color.darkred
				odpCButton.color = Color.darkred
		
			if(tr(qCat+"DO") == "A"):
				odpAButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "B"):
				odpBButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "C"):
				odpCButton.color = Color.darkgreen
			return
		elif (questionsCount > (GV.ogolneIlosc+1) and questionsCount <= (GV.ogolneIlosc + GV.znakiIlosc)):	
			pzQuestionIndex = pzQuestionIndex + 1
			print(pzQuestionIndex)
			pytanieNumer.text = "Pytanie nr " + str(questionsCount)
			pytanieTresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex]))
			pytanieObraz.texture = load("res://graphics/ZNAKI/PZ"+str(GV.pzList[pzQuestionIndex])+".jpg")
			odpATresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex])+"O1")
			odpBTresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex])+"O2")
			odpCTresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex])+"O3")
			
			pzAnswersIndex = pzAnswersIndex + 1	
			print(pzAnswersIndex)
			qCat = "PZ" + str(GV.pzList[pzQuestionIndex])
			twojaOdp.text = "Twoja odpowied??: " + str(GV.pzAnswers[pzAnswersIndex])
			poprawnaOdp.text = "Poprawna odpowied??: " + str(tr(qCat+"DO"))
			if (str(GV.pzAnswers[pzAnswersIndex]) == tr(qCat+"DO")):
				czyPoprawna.text = "ODPOWIEDZIA??E?? PRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.green)
			else:
				czyPoprawna.text = "ODPOWIEDZIA??E?? NIEPRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.red)
		
			if (str(GV.pzAnswers[pzAnswersIndex]) == "A"):
				odpAButton.color = Color.darkred
			if (str(GV.pzAnswers[pzAnswersIndex]) == "B"):
				odpBButton.color = Color.darkred
			if (str(GV.pzAnswers[pzAnswersIndex]) == "C"):
				odpCButton.color = Color.darkred
			if (str(GV.pzAnswers[pzAnswersIndex]) == "BRAK"):
				odpAButton.color = Color.darkred
				odpBButton.color = Color.darkred
				odpCButton.color = Color.darkred
		
			if(tr(qCat+"DO") == "A"):
				odpAButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "B"):
				odpBButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "C"):
				odpCButton.color = Color.darkgreen
			return
		elif (questionsCount == (GV.ogolneIlosc + GV.znakiIlosc +1)):
			pkQuestionIndex = 0
			print(pkQuestionIndex)
			pytanieNumer.text = "Pytanie nr " + str(questionsCount)
			pytanieTresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex]))
			pytanieObraz.texture = load("res://graphics/KRZYZOWKI/PK"+str(GV.pkList[pkQuestionIndex])+".jpg")
			odpATresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex])+"O1")
			odpBTresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex])+"O2")
			odpCTresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex])+"O3")
			
			pkAnswersIndex = 0	
			print(pkAnswersIndex)
			qCat = "PK" + str(GV.pkList[pkQuestionIndex])
			twojaOdp.text = "Twoja odpowied??: " + str(GV.pkAnswers[pkAnswersIndex])
			poprawnaOdp.text = "Poprawna odpowied??: " + str(tr(qCat+"DO"))
			if (str(GV.pkAnswers[pkAnswersIndex]) == tr(qCat+"DO")):
				czyPoprawna.text = "ODPOWIEDZIA??E?? PRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.green)
			else:
				czyPoprawna.text = "ODPOWIEDZIA??E?? NIEPRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.red)
		
			if (str(GV.pkAnswers[pkAnswersIndex]) == "A"):
				odpAButton.color = Color.darkred
			if (str(GV.pkAnswers[pkAnswersIndex]) == "B"):
				odpBButton.color = Color.darkred
			if (str(GV.pkAnswers[pkAnswersIndex]) == "C"):
				odpCButton.color = Color.darkred
			if (str(GV.pkAnswers[pkAnswersIndex]) == "BRAK"):
				odpAButton.color = Color.darkred
				odpBButton.color = Color.darkred
				odpCButton.color = Color.darkred
		
			if(tr(qCat+"DO") == "A"):
				odpAButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "B"):
				odpBButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "C"):
				odpCButton.color = Color.darkgreen
			return
		elif (questionsCount > (GV.ogolneIlosc + GV.znakiIlosc +1) and questionsCount <= GV.pytaniaIlosc):
			pkQuestionIndex = pkQuestionIndex + 1
			print(pkQuestionIndex)
			pytanieNumer.text = "Pytanie nr " + str(questionsCount)
			pytanieTresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex]))
			pytanieObraz.texture = load("res://graphics/KRZYZOWKI/PK"+str(GV.pkList[pkQuestionIndex])+".jpg")
			odpATresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex])+"O1")
			odpBTresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex])+"O2")
			odpCTresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex])+"O3")
			
			pkAnswersIndex = pkAnswersIndex + 1	
			print(pkAnswersIndex)
			qCat = "PK" + str(GV.pkList[pkQuestionIndex])
			twojaOdp.text = "Twoja odpowied??: " + str(GV.pkAnswers[pkAnswersIndex])
			poprawnaOdp.text = "Poprawna odpowied??: " + str(tr(qCat+"DO"))
			if (str(GV.pkAnswers[pkAnswersIndex]) == tr(qCat+"DO")):
				czyPoprawna.text = "ODPOWIEDZIA??E?? PRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.green)
			else:
				czyPoprawna.text = "ODPOWIEDZIA??E?? NIEPRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.red)
		
			if (str(GV.pkAnswers[pkAnswersIndex]) == "A"):
				odpAButton.color = Color.darkred
			if (str(GV.pkAnswers[pkAnswersIndex]) == "B"):
				odpBButton.color = Color.darkred
			if (str(GV.pkAnswers[pkAnswersIndex]) == "C"):
				odpCButton.color = Color.darkred
			if (str(GV.pkAnswers[pkAnswersIndex]) == "BRAK"):
				odpAButton.color = Color.darkred
				odpBButton.color = Color.darkred
				odpCButton.color = Color.darkred
		
			if(tr(qCat+"DO") == "A"):
				odpAButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "B"):
				odpBButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "C"):
				odpCButton.color = Color.darkgreen
			if (questionsCount == GV.pytaniaIlosc):
				nextButton.disabled = true
			return
		else:
			return
	else:
		return

func _on_PrevButton_pressed():
	
	odpAButton.color = Color.webgray
	odpBButton.color = Color.webgray
	odpCButton.color = Color.webgray
	nextButton.disabled = false
	
	if (questionsCount >= 1 and questionsCount <= GV.pytaniaIlosc):
		questionsCount = questionsCount - 1	
		if (questionsCount > 0 and questionsCount < GV.ogolneIlosc):
			poQuestionIndex = poQuestionIndex - 1
			print(poQuestionIndex)
			pytanieNumer.text = "Pytanie nr " + str(questionsCount)
			pytanieTresc.text = tr("PO"+str(GV.poList[poQuestionIndex]))
			var file2Check = File.new()
			var doFileExists = file2Check.file_exists("res://graphics/OGOLNE/PO"+str(GV.poList[poQuestionIndex])+".jpg")
			if (doFileExists == true):
				pytanieObraz.texture = load("res://graphics/OGOLNE/PO"+str(GV.poList[poQuestionIndex])+".jpg")
				odpATresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O1")
				odpBTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O2")
				odpCTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O3")
			else:
				pytanieObraz.texture = null
				odpATresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O1")
				odpBTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O2")
				odpCTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O3")
			
			poAnswersIndex = poAnswersIndex - 1		
			print(poAnswersIndex)
			qCat = "PO" + str(GV.poList[poQuestionIndex])
			twojaOdp.text = "Twoja odpowied??: " + str(GV.poAnswers[poAnswersIndex])
			poprawnaOdp.text = "Poprawna odpowied??: " + str(tr(qCat+"DO"))
			if (str(GV.poAnswers[poAnswersIndex]) == tr(qCat+"DO")):
				czyPoprawna.text = "ODPOWIEDZIA??E?? PRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.green)
			else:
				czyPoprawna.text = "ODPOWIEDZIA??E?? NIEPRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.red)
		
			if (str(GV.poAnswers[poAnswersIndex]) == "A"):
				odpAButton.color = Color.darkred
			if (str(GV.poAnswers[poAnswersIndex]) == "B"):
				odpBButton.color = Color.darkred
			if (str(GV.poAnswers[poAnswersIndex]) == "C"):
				odpCButton.color = Color.darkred
			if (str(GV.poAnswers[poAnswersIndex]) == "BRAK"):
				odpAButton.color = Color.darkred
				odpBButton.color = Color.darkred
				odpCButton.color = Color.darkred
		
			if(tr(qCat+"DO") == "A"):
				odpAButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "B"):
				odpBButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "C"):
				odpCButton.color = Color.darkgreen
				
			if (questionsCount == 1):
				prevButton.disabled = true
			return
		if (questionsCount == GV.ogolneIlosc):
			print(poQuestionIndex)
			pytanieNumer.text = "Pytanie nr " + str(questionsCount)
			pytanieTresc.text = tr("PO"+str(GV.poList[poQuestionIndex]))
			var file2Check = File.new()
			var doFileExists = file2Check.file_exists("res://graphics/OGOLNE/PO"+str(GV.poList[poQuestionIndex])+".jpg")
			if (doFileExists == true):
				pytanieObraz.texture = load("res://graphics/OGOLNE/PO"+str(GV.poList[poQuestionIndex])+".jpg")
				odpATresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O1")
				odpBTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O2")
				odpCTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O3")
			else:
				pytanieObraz.texture = null
				odpATresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O1")
				odpBTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O2")
				odpCTresc.text = tr("PO"+str(GV.poList[poQuestionIndex])+"O3")
			print(poAnswersIndex)
			qCat = "PO" + str(GV.poList[poQuestionIndex])
			twojaOdp.text = "Twoja odpowied??: " + str(GV.poAnswers[poAnswersIndex])
			poprawnaOdp.text = "Poprawna odpowied??: " + str(tr(qCat+"DO"))
			if (str(GV.poAnswers[poAnswersIndex]) == tr(qCat+"DO")):
				czyPoprawna.text = "ODPOWIEDZIA??E?? PRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.green)
			else:
				czyPoprawna.text = "ODPOWIEDZIA??E?? NIEPRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.red)
		
			if (str(GV.poAnswers[poAnswersIndex]) == "A"):
				odpAButton.color = Color.darkred
			if (str(GV.poAnswers[poAnswersIndex]) == "B"):
				odpBButton.color = Color.darkred
			if (str(GV.poAnswers[poAnswersIndex]) == "C"):
				odpCButton.color = Color.darkred
			if (str(GV.poAnswers[poAnswersIndex]) == "BRAK"):
				odpAButton.color = Color.darkred
				odpBButton.color = Color.darkred
				odpCButton.color = Color.darkred
		
			if(tr(qCat+"DO") == "A"):
				odpAButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "B"):
				odpBButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "C"):
				odpCButton.color = Color.darkgreen
			return
			
		elif (questionsCount > GV.ogolneIlosc and questionsCount < (GV.ogolneIlosc + GV.znakiIlosc)):	
			pzQuestionIndex = pzQuestionIndex - 1
			print(pzQuestionIndex)
			pytanieNumer.text = "Pytanie nr " + str(questionsCount)
			pytanieTresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex]))
			pytanieObraz.texture = load("res://graphics/ZNAKI/PZ"+str(GV.pzList[pzQuestionIndex])+".jpg")
			odpATresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex])+"O1")
			odpBTresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex])+"O2")
			odpCTresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex])+"O3")
			
			pzAnswersIndex = pzAnswersIndex - 1	
			print(pzAnswersIndex)
			qCat = "PZ" + str(GV.pzList[pzQuestionIndex])
			twojaOdp.text = "Twoja odpowied??: " + str(GV.pzAnswers[pzAnswersIndex])
			poprawnaOdp.text = "Poprawna odpowied??: " + str(tr(qCat+"DO"))
			if (str(GV.pzAnswers[pzAnswersIndex]) == tr(qCat+"DO")):
				czyPoprawna.text = "ODPOWIEDZIA??E?? PRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.green)
			else:
				czyPoprawna.text = "ODPOWIEDZIA??E?? NIEPRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.red)
		
			if (str(GV.pzAnswers[pzAnswersIndex]) == "A"):
				odpAButton.color = Color.darkred
			if (str(GV.pzAnswers[pzAnswersIndex]) == "B"):
				odpBButton.color = Color.darkred
			if (str(GV.pzAnswers[pzAnswersIndex]) == "C"):
				odpCButton.color = Color.darkred
			if (str(GV.pzAnswers[pzAnswersIndex]) == "BRAK"):
				odpAButton.color = Color.darkred
				odpBButton.color = Color.darkred
				odpCButton.color = Color.darkred
		
			if(tr(qCat+"DO") == "A"):
				odpAButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "B"):
				odpBButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "C"):
				odpCButton.color = Color.darkgreen
			return
			
		elif (questionsCount == (GV.ogolneIlosc + GV.znakiIlosc)):	
			print(pzQuestionIndex)
			pytanieNumer.text = "Pytanie nr " + str(questionsCount)
			pytanieTresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex]))
			pytanieObraz.texture = load("res://graphics/ZNAKI/PZ"+str(GV.pzList[pzQuestionIndex])+".jpg")
			odpATresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex])+"O1")
			odpBTresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex])+"O2")
			odpCTresc.text = tr("PZ"+str(GV.pzList[pzQuestionIndex])+"O3")
			print(pzAnswersIndex)
			qCat = "PZ" + str(GV.pzList[pzQuestionIndex])
			twojaOdp.text = "Twoja odpowied??: " + str(GV.pzAnswers[pzAnswersIndex])
			poprawnaOdp.text = "Poprawna odpowied??: " + str(tr(qCat+"DO"))
			if (str(GV.pzAnswers[pzAnswersIndex]) == tr(qCat+"DO")):
				czyPoprawna.text = "ODPOWIEDZIA??E?? PRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.green)
			else:
				czyPoprawna.text = "ODPOWIEDZIA??E?? NIEPRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.red)
		
			if (str(GV.pzAnswers[pzAnswersIndex]) == "A"):
				odpAButton.color = Color.darkred
			if (str(GV.pzAnswers[pzAnswersIndex]) == "B"):
				odpBButton.color = Color.darkred
			if (str(GV.pzAnswers[pzAnswersIndex]) == "C"):
				odpCButton.color = Color.darkred
			if (str(GV.pzAnswers[pzAnswersIndex]) == "BRAK"):
				odpAButton.color = Color.darkred
				odpBButton.color = Color.darkred
				odpCButton.color = Color.darkred
		
			if(tr(qCat+"DO") == "A"):
				odpAButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "B"):
				odpBButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "C"):
				odpCButton.color = Color.darkgreen
			return
		elif (questionsCount > (GV.ogolneIlosc + GV.znakiIlosc) and questionsCount < GV.pytaniaIlosc):
			pkQuestionIndex = pkQuestionIndex - 1
			print(pkQuestionIndex)
			pytanieNumer.text = "Pytanie nr " + str(questionsCount)
			pytanieTresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex]))
			pytanieObraz.texture = load("res://graphics/KRZYZOWKI/PK"+str(GV.pkList[pkQuestionIndex])+".jpg")
			odpATresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex])+"O1")
			odpBTresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex])+"O2")
			odpCTresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex])+"O3")
			pkAnswersIndex = pkAnswersIndex - 1
			print(pkAnswersIndex)
			qCat = "PK" + str(GV.pkList[pkQuestionIndex])
			twojaOdp.text = "Twoja odpowied??: " + str(GV.pkAnswers[pkAnswersIndex])
			poprawnaOdp.text = "Poprawna odpowied??: " + str(tr(qCat+"DO"))
			if (str(GV.pkAnswers[pkAnswersIndex]) == tr(qCat+"DO")):
				czyPoprawna.text = "ODPOWIEDZIA??E?? PRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.green)
			else:
				czyPoprawna.text = "ODPOWIEDZIA??E?? NIEPRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.red)
		
			if (str(GV.pkAnswers[pkAnswersIndex]) == "A"):
				odpAButton.color = Color.darkred
			if (str(GV.pkAnswers[pkAnswersIndex]) == "B"):
				odpBButton.color = Color.darkred
			if (str(GV.pkAnswers[pkAnswersIndex]) == "C"):
				odpCButton.color = Color.darkred
			if (str(GV.pkAnswers[pkAnswersIndex]) == "BRAK"):
				odpAButton.color = Color.darkred
				odpBButton.color = Color.darkred
				odpCButton.color = Color.darkred
		
			if(tr(qCat+"DO") == "A"):
				odpAButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "B"):
				odpBButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "C"):
				odpCButton.color = Color.darkgreen			
			return
		elif (questionsCount == GV.pytaniaIlosc):
			print(pkQuestionIndex)
			pytanieNumer.text = "Pytanie nr " + str(questionsCount)
			pytanieTresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex]))
			pytanieObraz.texture = load("res://graphics/KRZYZOWKI/PK"+str(GV.pkList[pkQuestionIndex])+".jpg")
			odpATresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex])+"O1")
			odpBTresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex])+"O2")
			odpCTresc.text = tr("PK"+str(GV.pkList[pkQuestionIndex])+"O3")
			print(pkAnswersIndex)
			qCat = "PK" + str(GV.pkList[pkQuestionIndex])
			twojaOdp.text = "Twoja odpowied??: " + str(GV.pkAnswers[pkAnswersIndex])
			poprawnaOdp.text = "Poprawna odpowied??: " + str(tr(qCat+"DO"))
			if (str(GV.pkAnswers[pkAnswersIndex]) == tr(qCat+"DO")):
				czyPoprawna.text = "ODPOWIEDZIA??E?? PRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.green)
			else:
				czyPoprawna.text = "ODPOWIEDZIA??E?? NIEPRAWID??OWO"
				czyPoprawna.set("custom_fonts/font", dynamic_font)
				czyPoprawna.add_color_override("font_color", Color.red)
		
			if (str(GV.pkAnswers[pkAnswersIndex]) == "A"):
				odpAButton.color = Color.darkred
			if (str(GV.pkAnswers[pkAnswersIndex]) == "B"):
				odpBButton.color = Color.darkred
			if (str(GV.pkAnswers[pkAnswersIndex]) == "C"):
				odpCButton.color = Color.darkred
			if (str(GV.pkAnswers[pkAnswersIndex]) == "BRAK"):
				odpAButton.color = Color.darkred
				odpBButton.color = Color.darkred
				odpCButton.color = Color.darkred
		
			if(tr(qCat+"DO") == "A"):
				odpAButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "B"):
				odpBButton.color = Color.darkgreen
			if(tr(qCat+"DO") == "C"):
				odpCButton.color = Color.darkgreen			
			return
		else:			
			return
	else:
		return


func _on_QuitButton_pressed():
	get_tree().quit()
