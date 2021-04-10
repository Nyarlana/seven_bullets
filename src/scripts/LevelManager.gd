extends Node

var levels := ["res://src/scenes/levels/TestLevel.tscn"]
var current_level := -1
signal level_loaded

func load_next_level(at : Node) -> void :
	var levelscn := load(levels[current_level+1])
	var level = levelscn.instance()
	at.add_child(level)
	emit_signal("level_loaded")
