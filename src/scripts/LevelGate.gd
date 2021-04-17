extends Node2D

signal level_won

func _ready() -> void:
	#$Sprite.texture.gradient.colors[0] = Color(0.0, 255.0, 249.0)
	$Sprite.frame = 0

func trigger() -> void:
	get_node("Area2D/CollisionShape2D").set_deferred("disabled", false)
	#$Sprite.texture.gradient.colors[0] = Color(255.0, 255.0, 0.0)
	$AnimationPlayer.play("OpenGate")

func _on_Area2D_area_entered(area):
	emit_signal("level_won")
