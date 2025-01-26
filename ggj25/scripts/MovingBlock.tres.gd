extends RigidBody3D

@export var angular_const: Vector3
@export var linear_const: Vector3
@export var linear_speed: float = 1

var time = 0.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	time += delta
	self.linear_velocity = linear_const * linear_speed * 2 * sin(time * linear_speed)
	self.angular_velocity = angular_const
	pass
