extends Control

func _ready():
	
	if (GV.czyZaliczone == "TAK"):
		$MarginContainer/VBoxContainer/Label.text = "Test ZALICZONY"
	elif (GV.czyZaliczone == "NIE"):
		$MarginContainer/VBoxContainer/Label.text = "Test NIEZALICZONY"
	
	$MarginContainer/VBoxContainer/Label3.text = str(GV.wynik)+"/20"
