extends Node2D

class_name Gun

export var ammo_cost := 1

signal shot(ac, dir) # ac : ammo cost, dir : direction

func _ready() -> void:
	position = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("player_shoot") :
		_shoot()

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _shoot() -> void:
	emit_signal("shot", ammo_cost, rotation)
	return
