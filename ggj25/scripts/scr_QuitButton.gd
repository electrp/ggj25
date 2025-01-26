extends Sprite2D

var clicked = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if clicked:
		get_parent().scale = Vector2(0.4, 0.4)
	else:
		get_parent().scale = Vector2(0.5, 0.5)

func _input(event) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			clicked = true
			
	if event is InputEventMouseButton and event.is_released() and event.button_index == MOUSE_BUTTON_LEFT:
		if clicked == true:
			clicked = false
			get_tree().quit()
