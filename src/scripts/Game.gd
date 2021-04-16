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
	$Transitions/AnimationPlayer.play("FadeDiamonds")
	emit_signal("reset")
	curr_level.deload()
	LevelManager.load_level(self, LevelManager.current_level)
	yield(LevelManager, "level_loaded")
	player.reset()
	emit_signal("ammo_consumed", player.bullets)

func gun_shot(shot_data: GunShot):
	var bullet : Node2D = shot_data.bullet.instance()
	bullet.position = shot_data.position
	bullet.rotation = shot_data.direction
	if bullet is Cluster :
		bullet.connect("spawn", self, "gun_shot")
	add_child(bullet)
	emit_signal("ammo_consumed", player.bullets)

func on_Level_Loaded(level : Level) -> void :
	level.connect("level_win", self, "on_Level_Win")
	level.connect("level_lost", self, "reset")
	level.connect("ungun", player, "remove_gun")
	curr_level = level
	$Transitions/AnimationPlayer.play_backwards("FadeDiamonds")
	player.position = level._get_Player_Spawn()
	player.enable()

func on_Level_Win() -> void :
	$Transitions/AnimationPlayer.play("FadeDiamonds")
	curr_level.queue_free()
	player.reset()
	LevelManager.load_next_level(self)
