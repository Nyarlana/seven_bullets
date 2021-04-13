extends Gun

onready var raycast := $RayCast2D
onready var line := $Line2D

func _ready() -> void:
	#raycast.set_cast_to(Vector2(0,50))
	pass

func _process(delta) -> void:
	line.points = PoolVector2Array([$Position2D.position, to_local(raycast.get_collision_point())])
