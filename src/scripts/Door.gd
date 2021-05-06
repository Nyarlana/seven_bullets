extends Node2D

var shader = preload("res://src/shaders/Dissolve.shader")

func _ready() -> void:
	#$Sprite.get_material().set_shader_param("dissolve_value", 1.0)
	pass

func trigger() :
	$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
	#self.hide()
	$Tween.interpolate_property(self, "scale", self.scale, Vector2(self.scale.x, 0.0), 0.1)
	$Tween.start()
	yield($Tween, "tween_completed")
	queue_free()
