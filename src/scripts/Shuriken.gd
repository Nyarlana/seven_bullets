extends Bullet

export var rotation_speed = PI * 2
export var speed = 10
var velocity := Vector2(speed, 0)

func _ready() -> void:
	velocity = velocity.rotated(rotation)

func _process(delta: float) -> void:
	$Bullet.rotate(rotation_speed * delta)
	$BulletCollision.rotate(rotation_speed * delta)
	position += velocity*(speed*delta)
