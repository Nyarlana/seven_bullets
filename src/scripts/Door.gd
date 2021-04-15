extends Node2D

export var target := Vector2.ZERO

func _ready() -> void:
	set_process(false)

func _process(delta) -> void:
	if (global_position - target).length() >= 5:
		global_position += (target - global_position) * delta 

func trigger() :
	$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
	set_process(true)
