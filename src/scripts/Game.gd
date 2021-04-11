extends Node

var curr_level : Node
onready var player := $Player
onready var gui := $GUI

signal ammo_consumed(ammo)
signal reset

func _ready() -> void :
	LevelManager.connect("level_loaded", self, "on_Level_Loaded")
	if LevelManager.current_level < 0 :
		LevelManager.load_next_level(self)

func _unhandled_input(event):
	if event.is_action_pressed("reset") :
		reset()

func reset() -> void:
	emit_signal("reset")
	curr_level.queue_free()
	LevelManager.load_level(self, LevelManager.current_level)
	player.reset()

func gun_shot(bullet_source : PackedScene, ammo_left : int, pos : Vector2, rotation : float) :
	var bullet : Node2D = bullet_source.instance()
	bullet.position = pos
	bullet.rotation = rotation
	add_child(bullet)
	emit_signal("ammo_consumed", ammo_left)

func on_Level_Loaded(level : Level) -> void :
	level.connect("level_win", self, "on_Level_Win")
	curr_level = level
	player.position = level._get_Player_Spawn()
	player.enable()

func on_Level_Win() -> void :
	LevelManager.load_next_level(self)
