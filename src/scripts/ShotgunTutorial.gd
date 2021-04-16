extends Level

var counter := 7

onready var gunpop : PackedScene = $SLPickup.gun

func deload() -> void:
	emit_signal("ungun", gunpop)
	queue_free()

func _on_Button_button_hit(clicks : int) -> void:
	counter -= 1
	if counter < 1 :
		$LevelGate.trigger()

func _get_Player_Spawn() -> Vector2 :
	return $Position2D.position
