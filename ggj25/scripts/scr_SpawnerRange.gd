extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited" , Callable(self, "_on_body_exited"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node) -> void:
	get_parent().can_shoot = false

func _on_body_exited(body: Node) -> void:
	get_parent().can_shoot = true
