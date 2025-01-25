extends Node3D

@export var door_time: float
@export var open: bool
@export var door_end: Vector3
var current_t: float = 0
var door_start: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	door_start = self.rotation
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if(open):
		current_t += delta / door_time
	else:
		current_t -= delta / door_time
	
	current_t = clamp(current_t, 0, 1)
	
	var rads: Vector3 = door_end / 180 * PI
	
	self.rotation = lerp(door_start, rads + door_start, current_t)
	pass
