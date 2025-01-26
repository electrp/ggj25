extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	for body in self.get_overlapping_bodies():
		if(body.is_in_group("bubble")):
			body.gravity = false
			var rb = body as RigidBody3D
			rb.gravity_scale = -.2	
			
