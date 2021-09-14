extends Node2D

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")

var uczenID
var imieText
var nazwiskoText
var klasaText
var rok_szkolny
var godzina
var currentDate
var wynik = 0
var czyZaliczone = "NIE"
var answerKey
var pzList = [1,1,1,1,1,1,1,1,1,1]
var poList = [1,1,1,1,1,1,1,1,1,1]
var pkList = [1,1,1,1,1]
var poAnswers = ["BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK"]
var pzAnswers = ["BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK","BRAK"]
var pkAnswers = ["BRAK","BRAK","BRAK","BRAK","BRAK"]

var db
var db_name = "res://database/database"

func _ready():
	db = SQLite.new()
	db.path = db_name
