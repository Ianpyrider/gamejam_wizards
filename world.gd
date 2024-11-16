extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var Enemy = load("res://enemies/enemy.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var rng = RandomNumberGenerator.new()
	var random_num = rng.randi_range(0, 30)
	
	if (random_num == 0):
		var create_enemy = Enemy.instantiate()
		self.add_child(create_enemy)
