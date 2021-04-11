extends Node2D

export var rotation_speed = PI * 2
export var speed = 10
var velocity := Vector2(speed, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#rotation = PI / 4
	velocity = velocity.rotated(rotation)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Bullet.rotate(rotation_speed * delta)
	$BulletCollision.rotate(rotation_speed * delta)
	position += velocity


func destroy(_ignored):
	hide()
	queue_free()
