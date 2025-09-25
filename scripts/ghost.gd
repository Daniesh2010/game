extends CharacterBody2D

var SPEED = 100
@export var player_path: NodePath

var player: CharacterBody2D

func _ready():
	player = get_node(player_path)

func _physics_process(delta: float) -> void:
	if player:
		var direction = (player.global_position - global_position)
		velocity = direction * SPEED * delta
	
	
	move_and_slide()
