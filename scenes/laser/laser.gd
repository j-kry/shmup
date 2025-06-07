extends Area2D

class_name Laser

var speed = 300

func _physics_process(delta: float) -> void:
	# move up the screen
	position.y -= speed * delta
	
	# if laser moves above the screen then remove laser
	if global_position.y <= -20:
		queue_free()

# if laser touches an enemy then remove laser
func _on_area_entered(area: Area2D) -> void:
	if area is Enemy:
		queue_free()
