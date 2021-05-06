extends Node2D

class_name Level

signal open
signal level_win
signal level_lost
signal ungun(gun)

func level_win() -> void :
	emit_signal("level_win")

func deload() -> void :
	queue_free()

func _get_Player_Spawn() -> Vector2 :
	return Vector2.ZERO

func _on_Lava_body_entered(body: Node) -> void:
	body.kill()
	body.position = _get_Player_Spawn()
	#emit_signal("level_lost")
