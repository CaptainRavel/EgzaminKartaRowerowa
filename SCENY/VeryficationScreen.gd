extends Control

var imie = false
var nazwisko = false
var klasa = false
 
func _ready():
	
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
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/OptionButton.theme = Theme.new()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/OptionButton.theme.default_font = DynamicFont.new()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/OptionButton.theme.default_font.font_data = load("res://CZCIONKI/droid-sans/DroidSans.ttf")
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/OptionButton.theme.default_font.size = 30
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/OptionButton.add_item("Wybierz swoją klasę")
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/OptionButton.set_item_disabled(0, true)
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/OptionButton.add_separator()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/OptionButton.add_item("IV A")
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/OptionButton.add_item("IV B")
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/OptionButton.add_item("IV C")
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/OptionButton.add_item("IV D")
	$MarginContainer/VBoxContainer/DalejButton.disabled = true

func _process(delta):
	if (imie == true and nazwisko == true and klasa == true):
		$MarginContainer/VBoxContainer/DalejButton.disabled = false


func _on_LineEditImie_text_changed(newImieText):
	if ($MarginContainer/VBoxContainer/HBoxContainer/GridContainer/LineEditImie.text.length() >=3):
		imie = true
		GV.imieText = newImieText
	else:
		imie = false
	

func _on_LineEditNazwisko_text_changed(newNazwiskoText):
	if ($MarginContainer/VBoxContainer/HBoxContainer/GridContainer/LineEditNazwisko.text.length() >=3):
		nazwisko = true
		GV.nazwiskoText = newNazwiskoText
	else:
		nazwisko = false

func _on_OptionButton_item_selected(index):
	klasa = true
	GV.klasaText = $MarginContainer/VBoxContainer/HBoxContainer/GridContainer/OptionButton.get_item_text(index)


func _on_DalejButton_pressed():
	print(GV.imieText)
	print(GV.nazwiskoText)
	print(GV.klasaText)
	get_tree().change_scene_to(load("res://SCENY/QuestionScreen.tscn"))
