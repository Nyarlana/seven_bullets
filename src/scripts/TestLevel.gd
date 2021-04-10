extends Level


var counter := 7



func _on_Button_button_hit() -> void:
	counter -= 1
	if counter < 1 :
		level_win()
