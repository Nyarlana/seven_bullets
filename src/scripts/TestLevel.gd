extends Level


var counter := 7
onready var gunpop : PackedScene = $SHPickup.gun

func deload() -> void:
	emit_signal("ungun", gunpop)
	queue_free()

func _get_Player_Spawn() -> Vector2 :
	return $Position2D.position

func _on_Button_button_hit(clicks : int) -> void:
	counter -= 1
	if counter < 1 :
		$LevelGate.trigger()


func _on_Lava_body_entered(body: Node) -> void:
	body.kill()
	body.position = _get_Player_Spawn()
	#emit_signal("level_lost")


func _on_Button2_button_end():
	$Door.trigger()

