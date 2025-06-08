extends Control

@onready var lives_3: TextureRect = $MarginContainer/LivesVBoxContainer/Lives3
@onready var lives_2: TextureRect = $MarginContainer/LivesVBoxContainer/Lives2
@onready var score_label: Label = $MarginContainer/ScoreVBoxContainer/ScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.died.connect(_on_died)
	score_label.text = "Score: %03d" % GameManager.score

func _physics_process(_delta: float) -> void:
	if GameManager.lives < 3:
		lives_3.visible = false
	if GameManager.lives < 2:
		lives_2.visible = false
		
	score_label.text = "Score: %03d" % GameManager.score


func _on_died():
	$MarginContainer/GameOverVBoxContainer/GameOverLabel.visible = true
