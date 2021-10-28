extends Node2D

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")

var uczenID
var imieText
var nazwiskoText
var klasaText
var rok_szkolny
var rok_szkolny_List = ["2020/2021"]
var godzina
var currentDate
var wynik = 0
var iloscPkt 
var czyZaliczone = "NIE"
var pytaniaCzas = 30
var krzyzowkiCzas = 60
var ogolneIlosc = 10
var znakiIlosc  = 10
var krzyzowkiIlosc = 10
var pytaniaIlosc
var answerKey
var pzList = [1,1,1,1,1,1,1,1,1,1]
var poList = [1,1,1,1,1,1,1,1,1,1]
var pkList = [1,1,1,1,1]
var poAnswers = ["BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK"]
var pzAnswers = ["BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK"]
var pkAnswers = ["BRAK","BRAK","BRAK","BRAK","BRAK"]
var accountDict = {1:["Arktur", "Wolarz"]}
var accIndex = 1
var filecontent

var db
var db_name = "res://database/database"

func _ready():
	
	db = SQLite.new()
	db.path = db_name
	
	pytaniaIlosc = ogolneIlosc + znakiIlosc + krzyzowkiIlosc
	iloscPkt = pytaniaIlosc
