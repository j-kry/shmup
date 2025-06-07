extends Area2D
class_name Enemy

signal touched_player
signal destroyed

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

# When the enemy is above the screen disable the collision
func _ready() -> void:
	collision_shape_2d.disabled = true


func _physics_process(delta: float) -> void:
	# move down the screen
	position.y += 20 * delta
	
	# allow collision when visible on screen
	if position.y >= -5:
		collision_shape_2d.disabled = false
	
	# when position is below the screen remove enemy
	if position.y >= 135:
		queue_free()
	
# if the area that enters the enemy is the laser
# then remove enemy
func _on_area_entered(area: Area2D) -> void:
	if area is Laser:
		queue_free()
		destroyed.emit()


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		touched_player.emit()
		queue_free()
