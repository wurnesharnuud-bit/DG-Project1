extends Node2D

var left_egg: bool = false

# Nest
func _on_nest_entered(body: Node2D) -> void:
	left_egg = true
func _on_nest_exited(body: Node2D) -> void:
	left_egg = false

# Win/Lose Con
func _on_final_door_entered(body: Node2D) -> void:
	if !left_egg: get_tree().change_scene_to_file("res://_Levels/Level_0_Tutorial.tscn")
	else:
		# Ya dun' won :)
		get_tree().change_scene_to_file("res://_Levels/WinScreen.tscn")
