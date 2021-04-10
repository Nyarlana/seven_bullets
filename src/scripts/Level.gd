extends Node2D

class_name Level

signal level_win
signal level_loaded

func level_win() -> void :
	emit_signal("level_win")

func deload() -> void :
	queue_free()
