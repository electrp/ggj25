extends Node

@export var enabled: bool = true

signal triggered

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass
		
func enable() -> void:
	enabled = true

func trigger() -> void:
	if enabled:
		triggered.emit()
		$AudioStreamPlayer3D.play()
