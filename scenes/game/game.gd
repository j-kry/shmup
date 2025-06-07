extends Node2D

const LASER_SCENE = preload("res://scenes/laser/laser.tscn")
const ENEMY_SCENE = preload("res://scenes/enemy/enemy.tscn")
@onready var enemies: Node2D = $Enemies
@onready var lasers: Node2D = $Lasers

# spawn an enemy when the game starts
func _ready() -> void:
	spawn_enemy()
	print("Lives: %s" % GameManager.lives)

# spawns an enemy
func spawn_enemy():
	# create a new enemy instance
	var enemy = ENEMY_SCENE.instantiate()
	enemy.touched_player.connect(_on_touched_player)
	# set the y pos to be above the screen
	enemy.position.y = -20
	# set the x pos to a random place within the screen bounds
	enemy.position.x = randf_range(8, 120)
	# add the enemy under the enemies node
	enemies.add_child(enemy)

# player emits the fired laser signal
func _on_player_fired_laser(pos) -> void:
	# create a new laser instance
	var laser = LASER_SCENE.instantiate()
	# set the laser position to the pos param
	# pos param is the position of a Marker2D on the player
	laser.position = pos
	# add the laser to the lasers node
	lasers.add_child(laser)

# Spawn an enemy when EnemySpawnTimer times out
func _on_enemy_spawn_timer_timeout() -> void:
	spawn_enemy()
	

func _on_touched_player():
	GameManager.lives -= 1
	print("Lives: %s" % GameManager.lives)
