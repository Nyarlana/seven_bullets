extends Bullet

export var rotation_speed := PI * 2
export var speed = 500
export var lifetime := 2
var velocity := Vector2(speed, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity = 800
	velocity = velocity.rotated(rotation)
	$Timer.connect("timeout", self, "destroy")
	$Timer.start(lifetime)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity.y += gravity * delta
	position += velocity * delta

