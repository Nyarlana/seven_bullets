extends Level


var counter := 7

func _get_Player_Spawn() -> Vector2 :
	return $Position2D.position

func _on_Button_button_hit(clicks : int) -> void:
	counter -= 1
	if counter < 1 :
		$LevelGate.trigger()


func _on_Button2_button_end():
	$Door.trigger()

