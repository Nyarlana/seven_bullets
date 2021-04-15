extends CanvasLayer

func _ready() -> void:
	get_parent().get_parent().player.disable()
