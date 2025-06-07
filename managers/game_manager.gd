extends Node

signal died

var lives: int = 3
var score: int = 0

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_N:
			print("hi there")
			#get_tree().paused = false
			#get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")

func _process(delta: float) -> void:
	if lives == 0:
		died.emit()
		get_tree().paused = true
