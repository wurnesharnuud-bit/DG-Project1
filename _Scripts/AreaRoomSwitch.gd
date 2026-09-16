extends Area2D

# To set new room, R-Click level scene
# and click "copy path", then paste
# into export variable 
@export var NewRoom: String

var playercount: int = 0

func _process(_delta: float) -> void:
	# Scene change when both players are within trigger
	# and if NewRoom has been set
	if playercount == 2 && NewRoom != null: get_tree().change_scene_to_file(NewRoom)

#region Player Detection
func _on_body_entered(_body: Node2D) -> void:
	playercount += 1
func _on_body_exited(_body: Node2D) -> void:
	playercount -= 1
#endregion
