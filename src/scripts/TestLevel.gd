extends Level


var counter := 7

func _get_Player_Spawn() -> Vector2 :
	return $Position2D.position

func _on_Button_button_hit() -> void:
	counter -= 1
	if counter < 1 :
		level_win()


func _on_Lava_body_entered(body: Node) -> void:
	body.kill()
