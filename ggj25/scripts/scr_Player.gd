extends Node3D

@onready var pause = get_node("../../../PauseMenu/Pause")  # Place PauseMenu as seen in lvl_NickTest
@onready var player = $CharacterBody3D
var isPaused = false
var isFullscreen = false

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	process_mode = Node.PROCESS_MODE_ALWAYS
	pause.visible = false
	pause.get_node("Control/Continue").connect("pressed", _continue)
	pause.get_node("Control/Exit").connect("pressed", _quit)

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
	if Input.is_action_just_pressed("ui_cancel"):
		if isPaused == false:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			pause.visible = true
			get_tree().paused = true
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			pause.visible = false
			get_tree().paused = false
		isPaused = !isPaused
