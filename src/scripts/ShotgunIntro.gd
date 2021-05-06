extends Level

onready var gunpop : PackedScene = $SHPickup.gun
var counter := 2

func deload() -> void:
	emit_signal("ungun", gunpop)
	queue_free()

func _get_Player_Spawn() -> Vector2 :
	return $Position2D.position


func shotgun_door() -> void:
	counter -= 1
	if counter < 1 :
		$Door.trigger()


func stairs_door() -> void:
	$Door2.trigger()
