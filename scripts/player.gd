extends CharacterBody2D

@export var SPEED = 240
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var DIRECTION = Input.get_vector("left", "right", "up", "down")
	velocity = DIRECTION * SPEED 
	print(velocity)
	
	#Animation
	if velocity.x < 0:
		animated_sprite.play("run_h")
		animated_sprite.flip_h = true
	elif velocity.x > 0:
		animated_sprite.play("run_h")
		animated_sprite.flip_h = false
	elif velocity.y < 0:
		animated_sprite.play("run_v_up")
	elif velocity.y > 0:
		animated_sprite.play("run_v_down")
	else:
		animated_sprite.play("idle")
	
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scenes/abandoned_house.tscn")
