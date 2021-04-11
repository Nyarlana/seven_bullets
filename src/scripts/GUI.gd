extends CanvasLayer
".."
func display_bullets(num : int) -> void :
	$Label.text = "Bullets : " + String(num)

func reset() -> void:
	$Label.text = "Bullets : 7"
