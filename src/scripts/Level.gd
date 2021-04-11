extends Node2D

class_name Level

signal level_win
#signal level_loaded

func level_win() -> void :
	emit_signal("level_win")

func deload() -> void :
	queue_free()

func _get_Player_Spawn() -> Vector2 :
	return Vector2.ZERO
