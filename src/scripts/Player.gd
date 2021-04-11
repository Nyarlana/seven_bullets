extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var gravity := 1000
export var jump_velocity := 500
export var speed := 300
var bullets := 7
var velocity := Vector2()
onready var anim := $AnimationPlayer

export (Array, PackedScene) var gun_classes: Array
var curren_gun = 0
var gun: Gun = null

var is_flipped := false

signal shoot(shot_data) #same as bullet but ammo is ammo left

# Called when the node enters the scene tree for the first time.
func _ready():
	change_gun(0)

func jump():
	velocity.y -= jump_velocity
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("switch_gun"):
		change_gun((curren_gun + 1) % gun_classes.size())

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_pressed("player_jump") and is_on_floor():
		jump()
	
	if Input.is_action_pressed("player_left") and is_on_floor():
		velocity.x = -speed
		if !$Sprite.flip_h:
			$Sprite.flip_h = true
	elif Input.is_action_pressed("player_right") and is_on_floor():
		velocity.x = speed
		if $Sprite.flip_h:
			$Sprite.flip_h = false
	elif is_on_floor():
		velocity.x = 0
	if velocity.length() >= 0 and anim.current_animation != "run":
		anim.play("run")
	elif anim.current_animation != "idle":
		anim.play("idle")
	

func kill() -> void:
	disable()
	emit_signal("dead")

func disable() -> void:
	pause_mode = PAUSE_MODE_STOP
	for child in get_children() :
		child.set_process_unhandled_input(false)
	set_physics_process(false)
	set_process(false)
	hide()

func enable() -> void:
	set_physics_process(true)
	set_process(true)
	pause_mode = PAUSE_MODE_INHERIT
	for child in get_children() :
		child.set_process_unhandled_input(true)
	show()

func reset() -> void:
	disable()
	bullets = 7
	velocity = Vector2.ZERO
	enable()
	
func change_gun(gun_number: int) -> void:
	if gun != null:
		remove_child(gun)
		gun.queue_free()
	gun = gun_classes[gun_number].instance()
	gun.connect("shot", self, "_on_shot")
	add_child(gun)
	curren_gun = gun_number

func _on_shot(shot_data: GunShot) -> void:
	if bullets >= shot_data.ammo_cost :
		bullets -= shot_data.ammo_cost
		var knockback = Vector2(shot_data.knockback, 0).rotated(shot_data.direction)
		velocity -= knockback
		print(knockback, velocity)
		emit_signal("shoot", shot_data)
