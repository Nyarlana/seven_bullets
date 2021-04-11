extends Area2D

class_name Bullet

func _ready() -> void:
	collision_layer = 0
	collision_mask = 0
	set_collision_layer_bit(2, true)
	set_collision_mask_bit(0, true)
	set_collision_mask_bit(1, true)
	connect("area_entered", self, "destroy")
	connect("body_entered", self, "destroy")



func destroy(_ignored = false):
	hide()
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
