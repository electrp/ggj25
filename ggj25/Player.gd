extends CharacterBody3D

# inspector variables
@export var walkSpeed = 4.0
@export var runSpeed = 8.0
@export var jumpVel = 4.5
@export var mouseSens = 0.3
@export var lerpSpeed = 10

# private variables
@onready var head = $Head
var direction = Vector3.ZERO

func _ready():
	process_mode = PROCESS_MODE_PAUSABLE

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-deg_to_rad(event.relative.x * mouseSens))
		head.rotate_x(-deg_to_rad(event.relative.y * mouseSens))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jumpVel

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	direction = lerp(direction, (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), delta * lerpSpeed)
	
	# Run
	var speed = walkSpeed
	if Input.is_action_pressed("ui_run"):
		speed = runSpeed
	
	# Calculate direction
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
