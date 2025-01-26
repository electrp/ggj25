extends Node3D

@onready var player = $CharacterBody3D
@onready var fan_obj = $CharacterBody3D/PortableFan/Fan

@onready var camera = $CharacterBody3D/Head/Camera3D
@onready var viewmodel_camera = $CharacterBody3D/Head/Camera3D/SubViewportContainer/SubViewport/ViewmodelCam

var isFullscreen = false

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	fan_obj.activate = Input.is_action_pressed("Activate")
