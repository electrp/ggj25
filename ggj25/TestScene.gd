extends Node3D

@onready var pause = $Pause
@onready var player = $Player
var isPaused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	process_mode = Node.PROCESS_MODE_ALWAYS
	$Pause/Control/Continue.connect("pressed", _continue)
	$Pause/Control/Exit.connect("pressed", _quit)
	
func _continue():
	if isPaused == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		pause.visible = false
		get_tree().paused = false
		isPaused = false
		
func _quit():
	get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("ui_cancel"):
		if isPaused == false:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			pause.visible = true
			get_tree().paused = true
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			pause.visible = false
			get_tree().paused = false
		isPaused = !isPaused
		
