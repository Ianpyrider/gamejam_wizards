extends CharacterBody2D

const SPEED = 600.0
var facing : Vector2
var reload = false
var timer
#
func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	
	timer.wait_time = 0.3
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)
	
	facing.x = 1
	facing.y = 0

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if (Input.is_key_pressed(KEY_J) and reload == false):
		shoot()
		reload = true
		timer.start()
	
	if direction:
		velocity = direction * SPEED
		facing = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	#_on_timer_timeout()

	move_and_slide()

@onready var Bullet = load("res://player/bullet.tscn")

func shoot():
	var b = Bullet.instantiate()
	b.facing = facing
	b.spawnPos = self.global_position
	b.top_level = true
	self.add_child(b)
	
func _on_timer_timeout() -> void:
	reload = false
