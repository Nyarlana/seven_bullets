extends Area2D


export var clicks := 1
signal button_hit
signal button_end


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if clicks <= 0 :
		$CollisionShape2D.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Button_area_entered(area: Area2D) -> void:
	clicks -= 1
	emit_signal("button_hit", clicks)
	if clicks < 1 :
		$Sprite.set_region_rect( Rect2(4,0,1,1) )
		$CollisionShape2D.disabled = true
		emit_signal("button_end")
