extends Area2D

@export_group("Stats")
@export var max_spawn: int = 10     # How many enemies may spawn per wave
@export var spawn_pause: float = 3  # How much time (seconds) pass between waves
@export var spawn_rate: float = 0.4 # How often an enemy spawns
@export var rate_var: float = 0.2   # Random value applied to spawn-rate
@export_category("Spawn Clamp")
@export var min_y: int = 00         # Min Y level of spawned enemies
@export var max_y: int = 256        # Max Y level of spawned enemies

var active_enemy: int = 0
var enemy = preload("res://Resources/Level1Enemy.res")

func _ready() -> void:
	spawn_enemy()

func check_spawn_new():
	if active_enemy != max_spawn:
		spawn_enemy()
	else:
		get_tree().create_timer(spawn_pause).timeout.connect(spawn_enemy)

func spawn_enemy():
	#region Create Enemy
	# Randomize Y Value
	var random_y = randf_range(min_y,max_y)
	
	# Instantiate Enemy
	var enemy_instance = enemy.instantiate()
	enemy_instance.global_position = Vector2(global_position.x, global_position.y + random_y)
	get_parent().add_child.call_deferred(enemy_instance)
	#endregion
	#region Spawn Cooldown
	# Update enemy count
	active_enemy += 1
	# Create new timer to spawn next enemy
	var spawn_time = spawn_rate + randf_range(-rate_var, rate_var) 
	get_tree().create_timer(spawn_time).timeout.connect(check_spawn_new)
	#endregion
