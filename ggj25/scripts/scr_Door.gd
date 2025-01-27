extends Node3D

@export var door_time: float
@export var open: bool
@export var door_end: Vector3
var current_t: float = 0
var door_start: Vector3
var justOpened = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	door_start = self.rotation
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if(open):
		current_t += delta / door_time
		if (justOpened == false):
			$AudioStreamPlayer3D.play()
			justOpened = true
	else:
		current_t -= delta / door_time
	
	current_t = clamp(current_t, 0, 1)
	
	var rads: Vector3 = door_end / 180 * PI
	
	self.rotation = Vector3(
		lerp(door_start.x, rads.x + door_start.x, current_t),
		lerp(door_start.y, rads.y + door_start.y, current_t),
		lerp(door_start.z, rads.z + door_start.z, current_t)
	)
	pass
	
func _open_handler() -> void:
	open = true

func _on_node_3d_bubble_entered() -> void:
	pass # Replace with function body.


func _on_bubble_button_triggered() -> void:
	pass # Replace with function body.


func _on_bubble_button_2_triggered() -> void:
	pass # Replace with function body.


func _on_bubble_button_3_triggered() -> void:
	open = true
	pass # Replace with function body.
