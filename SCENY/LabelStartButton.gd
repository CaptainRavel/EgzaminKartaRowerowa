extends Label


func _ready():
	var label = get_node("Label")
	label.set_message_translation(false)
	label.notification(NOTIFICATION_TRANSLATION_CHANGED)

