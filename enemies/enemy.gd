extends CharacterBody2D

const SPEED = 350.0
var player
var marker

func _ready() -> void:
	marker = get_node("../EnemySpawn")
	global_position = marker.position
	add_to_group("enemies")

func _process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	player = get_node("../Player")
	#print(player.global_position)
	
	var direction = (player.global_position - self.position).normalized()
	
	#if (direction.x > 0):
	velocity.x = direction.x * SPEED
		
	#if (direction.y > 0):
	velocity.y = direction.y * SPEED
	
	move_and_slide()

func _on_collision_detection_body_entered(body: Node2D) -> void:
	if (body.name == "Player"):
		get_tree().change_scene_to_file("res://main.tscn") # Replace with function body.
