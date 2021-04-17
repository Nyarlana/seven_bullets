extends CanvasLayer

onready var bulletjauge := $TextureRect/TextureProgress2
onready var bulletflash := $TextureRect/TextureProgress

func display_bullets(num : int) -> void :
	bulletjauge.value = num
	yield(get_tree().create_timer(0.05), "timeout")
	#bulletflash.value = num
	$Tween.interpolate_property(bulletflash, "value", bulletflash.value, num, 0.05)
	$Tween.start()

func reset() -> void:
	bulletjauge.value = 7
	bulletflash.value = 7
