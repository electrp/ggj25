extends Node

signal bubble_entered

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if(body.name == "Bubble"):
		bubble_entered.emit()
	print(body.name)
	pass # Replace with function body.
