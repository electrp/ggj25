extends Sprite2D

var start_anim = false
var time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(start_anim):
		time += delta
		if(time < 3 and time != 0):
			var space = (time / 3)
			self.modulate.a = lerpf(0, 1, space)
		elif (time < 6):
			var space = (time - 3) / 3
			self.modulate.a = 1
		elif (time < 9):
			var space = (time - 6) / 3
			self.modulate.a = lerpf(1, 0, space)
		else:
			self.modulate.a = 0
	pass
	
	


func _on_area_3d_end() -> void:
	start_anim = true;
	pass # Replace with function body.
