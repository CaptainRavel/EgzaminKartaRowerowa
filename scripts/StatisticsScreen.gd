extends Control


var zapytanieText
var zapytanieLabel
var imieTable
var idTable
var nazwiskoTable
var klasaTable
var rokTable
var dataTable
var godzinaTable
var wynikTable
var zaliczoneTable
var save_path = "user://game_save.txt"
var content = []
var header = "ID;IMIĘ;NAZWISKO;KLASA;ROK SZKOLNY;DATA;GODZINA;WYNIK;ZALICZENIE"
var idText = ";"
var imieText = ";"
var nazwiskoText = ";"
var klasaText = ";"
var rokText = ";"
var dataText = ";"
var godzinaText = ";"
var wynikText = ";"
var zaliczoneText = ";"
var nrKwerendy = 0

func _ready():
	$MarginContainer/VBoxContainer/HBoxContainer/Button2.disabled = true
	zapytanieLabel = get_node("VBoxContainer/TextEdit")
	idTable = get_node("VBoxContainer/ScrollContainer/GridContainer/Label")
	imieTable = get_node("VBoxContainer/ScrollContainer/GridContainer/Label2")
	nazwiskoTable = get_node("VBoxContainer/ScrollContainer/GridContainer/Label3")
	klasaTable = get_node("VBoxContainer/ScrollContainer/GridContainer/Label4")
	rokTable = get_node("VBoxContainer/ScrollContainer/GridContainer/Label5")
	dataTable = get_node("VBoxContainer/ScrollContainer/GridContainer/Label6")
	godzinaTable = get_node("VBoxContainer/ScrollContainer/GridContainer/Label7")
	wynikTable = get_node("VBoxContainer/ScrollContainer/GridContainer/Label8")
	zaliczoneTable = get_node("VBoxContainer/ScrollContainer/GridContainer/Label9")
	content.append(header)

func _on_TextEdit_text_changed():
	zapytanieText = zapytanieLabel.text

func _odczyt_Bazy():
	GV.db.open_db()
	GV.db.query(zapytanieText)
	for i in range (0, GV.db.query_result.size()):
		if "ID" in GV.db.query_result[i]:
			idTable.text += GV.db.query_result[i]["ID"] + "\n--------------------------------------------------\n"
			idText = GV.db.query_result[i]["ID"] + ";"
		if "imie" in GV.db.query_result[i]:
			imieTable.text += GV.db.query_result[i]["imie"] + "\n--------------------------------------------------\n"
			imieText = GV.db.query_result[i]["imie"] + ";"
		if "nazwisko" in GV.db.query_result[i]:
			nazwiskoTable.text += GV.db.query_result[i]["nazwisko"] + "\n--------------------------------------------------\n"
			nazwiskoText = GV.db.query_result[i]["nazwisko"] + ";"
		if "klasa" in GV.db.query_result[i]:
			klasaTable.text += GV.db.query_result[i]["klasa"] + "\n--------------------------------------------------\n"
			klasaText = GV.db.query_result[i]["klasa"] + ";"
		if "rok_szkolny" in GV.db.query_result[i]:
			rokTable.text += GV.db.query_result[i]["rok_szkolny"] + "\n--------------------------------------------------\n"
			rokText = GV.db.query_result[i]["rok_szkolny"] + ";"
		if "data" in GV.db.query_result[i]:
			dataTable.text += GV.db.query_result[i]["data"] + "\n--------------------------------------------------\n"
			dataText = GV.db.query_result[i]["data"] + ";"
		if "godzina" in GV.db.query_result[i]:
			godzinaTable.text += GV.db.query_result[i]["godzina"] + "\n--------------------------------------------------\n"
			godzinaText = GV.db.query_result[i]["godzina"] + ";"
		if "wynik" in GV.db.query_result[i]:
			wynikTable.text += GV.db.query_result[i]["wynik"] + "\n--------------------------------------------------\n"
			wynikText = GV.db.query_result[i]["wynik"] + ";"
		if "czy_zaliczone" in GV.db.query_result[i]:
			zaliczoneTable.text += GV.db.query_result[i]["czy_zaliczone"] + "\n--------------------------------------------------\n"
			zaliczoneText = GV.db.query_result[i]["czy_zaliczone"]
		content.append(idText + imieText + nazwiskoText + klasaText + rokText + dataText + godzinaText + wynikText + zaliczoneText)
	

func _on_Button_pressed():
	idTable.text = ""
	imieTable.text = ""
	nazwiskoTable.text = ""
	klasaTable.text = ""
	rokTable.text = ""
	dataTable.text = ""
	godzinaTable.text = ""
	wynikTable.text = ""
	zaliczoneTable.text = ""
	
	idText = ";"
	imieText = ";"
	nazwiskoText = ";"
	klasaText = ";"
	rokText = ";"
	dataText = ";"
	godzinaText = ";"
	wynikText = ";"
	zaliczoneText = ";"
	content.clear()
	content.append(header)
	
	$VBoxContainer/HBoxContainer/Button2.disabled = false
	
	_odczyt_Bazy()

func _on_Button2_pressed():
	nrKwerendy += 1
	var f = File.new()
	f.open("res://database/kwerenda"+str(nrKwerendy)+".txt", File.WRITE)
	for i in range(content.size()):
		f.store_line(String(content[i]))
	f.close()


func _on_QuitButton_pressed():
	get_tree().change_scene_to(load("res://scenes/Menu.tscn"))
