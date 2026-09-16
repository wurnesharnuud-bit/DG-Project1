extends CharacterBody2D

var speed: float = 8000
var direction: int = -1
const DESPAWN_DIST: int = -200 

func _process(delta: float) -> void:
	# Moves enemy
	velocity.x = (speed * direction) * delta
	
	# Checks if enemy is off-screen & removes if true
	if global_position.x < DESPAWN_DIST: queue_free()
	
	# Runs updates movement
	move_and_slide()

#region Collision Detection
# If enemy hits player MAIN, despawn
func _on_main_body_entered(body: Node2D) -> void:
	queue_free()
# If enemy hits player MINOR, restart the game
func _on_minor_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://_Levels/Level_0_Tutorial.tscn")
#endregion
