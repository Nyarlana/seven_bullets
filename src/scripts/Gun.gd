extends Node2D

class_name Gun

export var ammo_cost := 1
export var bullet_spawn_path: NodePath
export var bullet : PackedScene

onready var bullet_spawn: Node2D = get_node(bullet_spawn_path)

signal shot(shot_data) # bullet : bullet packedscene, ac : ammo cost, dir : direction

func _ready() -> void:
	position = Vector2.ZERO

func _unhandled_input(event) -> void:
	if event.is_action_pressed("player_shoot") :
		_shoot()

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _shoot() -> void:
	signal_shoot()

func signal_shoot() -> void:
	var shot = GunShot.new()
	shot.bullet = bullet
	shot.ammo_cost = ammo_cost
	shot.position = bullet_spawn.global_position
	shot.direction = rotation
	emit_signal("shot", shot)
#	var new_bullet: Node2D = bullet.instance()
#	new_bullet.position = get_node(bullet_spawn).position
#	new_bullet.rotation = rotation
#	add_child(new_bullet)
