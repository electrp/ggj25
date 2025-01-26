extends Node2D

@onready var pause = $Pause

var isPaused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	process_mode = Node.PROCESS_MODE_ALWAYS
	pause.visible = false
	pause.get_node("ContControl/Continue").connect("pressed", _continue)
	pause.get_node("ExitControl/Exit").connect("pressed", _quit)
	pause.get_node("RestControl/Restart").connect("pressed", _restart)

func _continue():
	if isPaused == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		pause.visible = false
		get_tree().paused = false
		isPaused = false

func _quit():
	get_tree().quit()
	
func _restart():
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		pause.visible = false
		get_tree().paused = false
		isPaused = false
		get_tree().reload_current_scene()
	
	

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
