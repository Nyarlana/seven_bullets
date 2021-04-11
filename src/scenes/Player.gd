extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var gravity := 1000
export var jump_velocity := 500
export var speed := 300
var velocity := Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func jump():
	velocity.y -= jump_velocity
	
#func _process(delta: float) -> void:
#	pass

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_pressed("player_jump") and is_on_floor():
		jump()
	
	if Input.is_action_pressed("player_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("player_right"):
		velocity.x = speed
	else:
		velocity.x = 0
	
