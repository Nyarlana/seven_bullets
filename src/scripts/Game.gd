extends Node

var curr_level : Node
onready var player := $Player
onready var gui := $GUI

func _ready() -> void :
	LevelManager.connect("level_loaded", self, "on_Level_Loaded")



func on_Level_Loaded(level : Level) -> void :
	level.connect("level_win", self, "on_Level_Win")
	curr_level = level
	player.position = level._get_Player_Spawn()

func on_Level_Win() -> void :
	LevelManager.load_next_level(self)
