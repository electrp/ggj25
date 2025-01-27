extends CSGCylinder3D

@export var bubble_scene: PackedScene
@export var spawned_bubble: RigidBody3D

@export var enabled: bool = true

var canShoot = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (spawned_bubble == null) and canShoot == true and enabled:
		$AudioStreamPlayer3D.play()
		spawned_bubble = bubble_scene.instantiate();
		add_child(spawned_bubble);
		spawned_bubble.position = $Marker3D.position
		spawned_bubble.apply_impulse(($Marker3D.global_position - global_position) * 30)
		
	if spawned_bubble != null:
		$AudioStreamPlayer3D.position = spawned_bubble.position
		
	pass

func _on_body_entered(body: Node):
	canShoot = true
	
	


func enable_bubble() -> void:
	enabled = true
	pass # Replace with function body.
