extends CharacterBody3D

# inspector variables
@export var walkSpeed = 4.0
@export var runSpeed = 8.0
@export var jumpVel = 4.5
@export var mouseSens = 0.3
@export var lerpSpeed = 8.0

# private variables
@onready var head = $Head
var direction = Vector3.ZERO
var currentSpeed = 0.0 
var isRunning = false

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

	# Handle running input only when on the floor
	if is_on_floor():
		isRunning = Input.is_action_pressed("ui_run")

	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	direction = lerp(direction, (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), delta * lerpSpeed)
	
	# Set the target speed based on running state
	var targetSpeed = walkSpeed
	if isRunning:
		targetSpeed = runSpeed

	# Smoothly interpolate speed
	currentSpeed = lerp(currentSpeed, targetSpeed, delta * lerpSpeed)
	
	# Calculate velocity
	if direction:
		velocity.x = direction.x * currentSpeed
		velocity.z = direction.z * currentSpeed
	else:
		velocity.x = move_toward(velocity.x, 0, walkSpeed * delta)
		velocity.z = move_toward(velocity.z, 0, walkSpeed * delta)

	move_and_slide()
