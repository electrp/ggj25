extends Node3D

var plane: Plane
var falloff_scale: float
@export var falloff: bool
@export var power: float
@export var activate: bool = true

@onready var end_marker: Node3D = $Area3D/CollisionShape3D/EndMarker
@onready var particle_emitter = $GPUParticles3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if !activate:
		particle_emitter.emitting = false
		return
	else:
		particle_emitter.emitting = true

	var norm = end_marker.global_position - self.global_position
	falloff_scale = norm.length()
	plane = Plane(norm.normalized(), self.global_position)

	for node in $Area3D.get_overlapping_bodies():
		if !node.is_in_group("pushable"):
			continue

		if !node is RigidBody3D:
			continue

		var rb = node as RigidBody3D
		#
		#var ray_origin = self.global_position
		#var ray_target = node.global_position
		#var space_state = get_world_3d().direct_space_state
		#
		#var query = PhysicsRayQueryParameters3D.new()
		#query.from = ray_origin
		#query.to = ray_target
		#query.collide_with_bodies = true
		#query.exclude = [self, node]
		#
		#var result = space_state.intersect_ray(query)
		#if result.size() > 0:
			#continue

		if falloff:
			var dist: float = plane.distance_to(node.global_position)
			var scale = abs(1 - dist / falloff_scale)
			rb.apply_impulse(power * scale * plane.normal)
		else:
			rb.apply_impulse(power * plane.normal)


func _on_pre_bubble_button_triggered() -> void:
	pass # Replace with function body.


func _on_bubble_button_3_triggered() -> void:
	pass # Replace with function body.
