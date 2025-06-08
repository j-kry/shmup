extends CharacterBody2D
class_name Player

signal fired_laser(pos)

const SPEED = 100.0
@onready var laser_spawn_point: Marker2D = $LaserSpawnPoint
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var laser_fire_sound: AudioStreamPlayer = $LaserFireSound

var can_fire: bool = true


func _ready() -> void:
	GameManager.died.connect(_on_died)


func _physics_process(_delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED
	clamp_position()
	handle_fire()
	
	move_and_slide()


func handle_fire():
	if Input.is_action_pressed("fire") and fire_rate_timer.is_stopped():
		fired_laser.emit(laser_spawn_point.global_position)
		laser_fire_sound.play()
		fire_rate_timer.start()
		

func clamp_position():
	if position.x <= 8:
		position.x = 8
	elif position.x >= 120:
		position.x = 120

func _on_died():
	queue_free()
