#extends Area2D
#
#
## Called when the node enters the scene tree for the first time.
#
## Call_d every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

extends Area2D

var speed = 750

var spawnPos : Vector2
var facing: Vector2

func _ready() -> void:
	global_position = spawnPos

func _physics_process(delta):
	position.x += facing.x * speed * delta
	position.y += facing.y * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("enemies")):
		body.queue_free()
		queue_free()
