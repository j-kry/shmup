extends Node2D

signal spawn_enemy

const ENEMY_SCENE: PackedScene = preload("res://scenes/enemy/enemy.tscn")
@onready var spawn_timer: Timer = $SpawnTimer

func _physics_process(delta: float) -> void:
	pass


func _on_spawn_timer_timeout() -> void:
	spawn_enemy.emit()
