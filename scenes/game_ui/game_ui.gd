extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.died.connect(_on_died)


func _on_died():
	$MarginContainer/GameOverVBoxContainer/GameOverLabel.visible = true
