extends Control

var imie = false
var nazwisko = false
var klasa = false
var klasaButton
var nextButton
var lineImie
var lineNazwisko
 
func _ready():
	
	klasaButton = get_node("Margin/VBoxContainer/HBoxContainer/GridContainer/KlasaButton")
	nextButton = get_node("Margin/VBoxContainer/DalejButton")
	lineImie = get_node("Margin/VBoxContainer/HBoxContainer/GridContainer/LineEditImie")
	lineNazwisko = get_node("Margin/VBoxContainer/HBoxContainer/GridContainer/LineEditNazwisko")
	
	var currTime = OS.get_time()
	var hour =  currTime["hour"]
	var minutes = currTime["minute"]
	if	(hour < 10 and minutes <10):
		GV.godzina = "0"+str(hour)+":0"+str(minutes)
	elif (hour < 10 and minutes >= 10):
		GV.godzina = "0"+str(hour)+":"+str(minutes)
	elif (hour >= 10 and minutes < 10):
		GV.godzina = str(hour)+":0"+str(minutes)
	else:
		GV.godzina = str(hour)+":"+str(minutes)
	print(GV.godzina)
	var date= OS.get_datetime()
	var day = date["day"]
	var month= date["month"]
	var year= date["year"] 
	if (day < 10 and month <10):
		GV.currentDate = "0"+str(day)+".0"+str(month)+"."+str(year)
	elif (day < 10 and month >=10):
		GV.currentDate = "0"+str(day)+"."+str(month)+"."+str(year)
	elif (month < 10 and day >=10):
		GV.currentDate = str(day)+".0"+str(month)+"."+str(year)
	else:
		GV.currentDate = str(day)+"."+str(month)+"."+str(year)
	print(GV.currentDate)
	
	if (month >= 1 and month < 9):
		GV.rok_szkolny = str(year - 1)+"/"+str(year)
	else:
		GV.rok_szkolny = str(year)+"/"+str(year + 1)
	
	print(GV.rok_szkolny)
	klasaButton.theme = Theme.new()
	klasaButton.theme.default_font = DynamicFont.new()
	klasaButton.theme.default_font.font_data = load("res://fonts/droid-sans/DroidSans.ttf")
	klasaButton.theme.default_font.size = 30
	klasaButton.add_item("Wybierz swoją klasę")
	klasaButton.set_item_disabled(0, true)
	klasaButton.add_separator()
	klasaButton.add_item("IV A")
	klasaButton.add_item("IV B")
	klasaButton.add_item("IV C")
	klasaButton.add_item("IV D")
	nextButton.disabled = true

func _process(delta):
	if (imie == true and nazwisko == true and klasa == true):
		nextButton.disabled = false


func _on_LineEditImie_text_changed(newImieText):
	if (lineImie.text.length() >=3):
		imie = true
		GV.imieText = newImieText
	else:
		imie = false
	

func _on_LineEditNazwisko_text_changed(newNazwiskoText):
	if (lineNazwisko.text.length() >=3):
		nazwisko = true
		GV.nazwiskoText = newNazwiskoText
	else:
		nazwisko = false

func _on_OptionButton_item_selected(index):
	klasa = true
	GV.klasaText = klasaButton.get_item_text(index)


func _on_DalejButton_pressed():
	print(GV.imieText)
	print(GV.nazwiskoText)
	print(GV.klasaText)
	get_tree().change_scene_to(load("res://scenes/QuestionScreen.tscn"))
