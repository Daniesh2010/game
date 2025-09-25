extends Label

@onready var timer: Timer = $Timer

@export var full_text = "It was a cold dark night....."
var index := 0

func _ready() -> void:
	text = ""


func _on_timer_timeout() -> void:
	if index < full_text.length():
		text += full_text[index]
		index += 1
	else:
		timer.stop()
