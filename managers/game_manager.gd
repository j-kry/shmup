extends Node

signal died

var lives: int = 3
var score: int = 0
var enemy_fall_speed = 20
var enemy_spawn_rate = 1.0


func _physics_process(_delta: float) -> void:
	if lives == 0:
		died.emit()
		await get_tree().create_timer(1.0).timeout
		get_tree().paused = true
		get_tree().create_timer(2.0).timeout.connect(reset_game)
	
	if score >= 5:
		enemy_fall_speed = 40
		enemy_spawn_rate = 0.8
	if score >= 20:
		enemy_fall_speed = 60
		enemy_spawn_rate = 0.5
	if score >= 30:
		enemy_fall_speed = 70

func reset_game():
	lives = 3
	score = 0
	enemy_fall_speed = 20
	enemy_spawn_rate = 1.0
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
