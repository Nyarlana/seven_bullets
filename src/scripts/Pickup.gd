extends Area2D

export var gun : PackedScene

func _on_Node2D_body_entered(body: Node) -> void:
	if body.is_in_group("player") :
		body.add_gun(gun)
		queue_free()
