extends Node

var curr_level : Node
onready var player := $Player
onready var gui := $GUI
onready var anim := $Transitions/AnimationPlayer

signal ammo_consumed(ammo)
signal reset

func _ready() -> void :
	gui.reset()
	LevelManager.connect("level_loaded", self, "on_Level_Loaded")
	if LevelManager.current_level < 0 :
		LevelManager.load_next_level(self)

func _unhandled_input(event):
	if event.is_action_pressed("reset") :
		reset()

func reset() -> void:
	anim.play("FadeDiamonds", -1, 2.0)
	yield(anim, "animation_finished")
	emit_signal("reset")
	curr_level.deload()
	LevelManager.load_level(self, LevelManager.current_level)
	yield(LevelManager, "level_loaded")
	player.reset()
	emit_signal("ammo_consumed", 7)

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
	anim.play_backwards("FadeDiamonds")
	player.position = level._get_Player_Spawn()
	player.connect("dead", self, "_on_player_death")
	yield(anim, "animation_finished")
	player.enable()

func on_Level_Win() -> void :
	anim.play("FadeDiamonds")
	yield(anim, "animation_finished")
	curr_level.queue_free()
	player.reset()
	emit_signal("ammo_consumed", 7)
	LevelManager.load_next_level(self)

func _on_player_death() -> void :
	reset()
