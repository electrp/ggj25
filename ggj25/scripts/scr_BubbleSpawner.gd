extends CSGCylinder3D

@export var bubble_scene: PackedScene
@export var spawned_bubble: RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(spawned_bubble == null):
		spawned_bubble = bubble_scene.instantiate();
		add_child(spawned_bubble);
		spawned_bubble.position = $Marker3D.position
	pass
