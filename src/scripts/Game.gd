extends Node

var curr_level : Node

func _ready() -> void :
	LevelManager.connect("level_loaded", self, "on_Level_Loaded")



func on_Level_Loaded(level : Level) -> void :
	level.connect("level_win", self, "on_Level_Win")
	curr_level = level

func on_Level_Win() -> void :
	LevelManager.load_next_level(self)
