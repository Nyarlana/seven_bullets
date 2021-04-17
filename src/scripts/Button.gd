extends Area2D


export var clicks := 1
signal button_hit
signal button_end


func _ready() -> void:
	$Sprite.material = ShaderMaterial.new()
	if clicks <= 0 :
		set_deferred($CollisionShape2D.disabled, true)
	$Label.text = String(clicks)


func _on_Button_area_entered(area: Area2D) -> void:
	clicks -= 1
	emit_signal("button_hit", clicks)
	$Label.text = String(clicks)
	if clicks < 1 :
		$Sprite.set_region_rect( Rect2(32,0,32,32) )
		#$CollisionShape2D.disabled = true
		$CollisionShape2D.set_deferred("disabled", true)
		emit_signal("button_end")
	$Sprite.material.shader = load("res://src/shaders/White.shader")
	yield(get_tree().create_timer(0.05), "timeout")
	$Sprite.material = ShaderMaterial.new()
