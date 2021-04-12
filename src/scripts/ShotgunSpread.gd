extends Cluster

export var shell : PackedScene

func _ready() -> void:
	var gs := GunShot.new()
	gs.bullet = shell
	gs.ammo_cost = 0
	gs.knockback = 0.0
	yield(get_tree(), "idle_frame")
	for child in $Node.get_children() :
		gs.position = child.get_global_position()
		gs.direction = child.rotation + rotation
		emit_signal("spawn", gs)
	queue_free()
