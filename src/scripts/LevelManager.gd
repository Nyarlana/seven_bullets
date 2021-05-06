extends Node

var levels := [ "res://src/scenes/levels/Tutorial.tscn",
				"res://src/scenes/levels/ShotgunIntro.tscn",
				"res://src/scenes/levels/TestLevel.tscn",
				"res://src/scenes/levels/endGame.tscn"]
var current_level := -1
signal level_loaded

func load_next_level(at : Node) -> void :
	load_level(at, current_level+1)
	current_level+=1
	return

func load_level(at : Node, lvl : int) -> void :
	var levelscn := load(levels[lvl])
	var level : Level = levelscn.instance()
	#at.add_child(level)
	at.call_deferred("add_child", level)
	yield(level, "tree_entered")
	at.move_child(level, 0)
	emit_signal("level_loaded", level)
	return
