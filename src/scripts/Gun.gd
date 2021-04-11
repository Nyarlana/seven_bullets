extends Node2D

class_name Gun

export var ammo_cost := 1
export var bullet_spawn: NodePath
export var bullet : PackedScene

signal shot(bullet, ac, pos, dir) # bullet : bullet packedscene, ac : ammo cost, dir : direction

func _ready() -> void:
	position = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("player_shoot") :
		_shoot()

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _shoot() -> void:
	signal_shoot()

func signal_shoot() -> void:
	var spawn: Node2D = get_node(bullet_spawn)
	emit_signal("shot", bullet,  ammo_cost, spawn.global_position, rotation)
#	var new_bullet: Node2D = bullet.instance()
#	new_bullet.position = get_node(bullet_spawn).position
#	new_bullet.rotation = rotation
#	add_child(new_bullet)
