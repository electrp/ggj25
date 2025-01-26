extends Node3D

@onready var player = $CharacterBody3D
@onready var fan_obj = $CharacterBody3D/PortableFan/Fan
@onready var raycast = $CharacterBody3D/Head/Camera3D/RayCast3D

var isFullscreen = false

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	fan_obj.activate = Input.is_action_pressed("Activate")
	
	var pointing: Node3D = raycast.get_collider();
	if(pointing != null and pointing.is_in_group("interactable")):
		if(Input.is_action_just_pressed("Interact")):
			pointing.interact(self)
		pointing.hover(self)
		
	var input_reset := Input.is_action_pressed("Reset")
	if(input_reset):
		get_tree().reload_current_scene()
	
		
	
