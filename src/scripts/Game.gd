extends Node

var curr_level : Node
onready var player := $Player
onready var gui := $GUI

signal ammo_consumed(ammo)

func _ready() -> void :
	LevelManager.connect("level_loaded", self, "on_Level_Loaded")
	if LevelManager.current_level < 0 :
		LevelManager.load_next_level(self)

func _unhandled_input(event):
	if event.is_action_pressed("reset") :
		reset()

func reset() -> void:
	curr_level.queue_free()
	LevelManager.load_level(self, LevelManager.current_level)
	player.reset()
	emit_signal("ammo_consumed", player.bullets)

func gun_shot(shot_data: GunShot):
	var bullet : Node2D = shot_data.bullet.instance()
	bullet.position = shot_data.position
	bullet.rotation = shot_data.direction
	add_child(bullet)
	emit_signal("ammo_consumed", player.bullets)

func on_Level_Loaded(level : Level) -> void :
	level.connect("level_win", self, "on_Level_Win")
	curr_level = level
	player.position = level._get_Player_Spawn()
	player.enable()

func on_Level_Win() -> void :
	LevelManager.load_next_level(self)
