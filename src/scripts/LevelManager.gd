extends Node

var levels := ["res://src/scenes/levels/TestLevel.tscn"]
var current_level := -1
signal level_loaded

func load_next_level(at : Node) -> void :
	load_level(at, current_level+1)
	current_level+=1
	return

func load_level(at : Node, lvl : int) -> void :
	var levelscn := load(levels[lvl])
	var level : Level = levelscn.instance()
	at.add_child(level)
	emit_signal("level_loaded", level)
	return
