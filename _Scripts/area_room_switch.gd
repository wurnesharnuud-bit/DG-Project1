extends Area2D

# To set new room, R-Click level scene
# and click "copy path", then paste
# into export variable 

@export_category("Level Data")
@export_enum("Tutorial", "Winds", "Plates", "Door") var ThisIs = "Tutorial"
@export_enum("Tutorial", "Winds", "Plates", "Door") var NextLocation = "Tutorial"
@export var NewRoom: String

var playercount: int = 0

#region Player Detection
func _on_body_entered(_body: Node2D) -> void:
	playercount += 1
	if playercount == 2 && NewRoom != null: 
		GlobalLevelUpdater()
func _on_body_exited(_body: Node2D) -> void:
	playercount -= 1
#endregion

func GlobalLevelUpdater() -> void:
	Flag.Loc.CurLoc = NextLocation
	
	match ThisIs:
		"Tutorial":
			Flag.s.HasFinishedLevel0 = true
		"Winds":
			Flag.s.HasFinishedLevel1 = true
		"Plates":
			Flag.s.HasFinishedLevel2 = true
		"Door":
			Flag.s.HasFinishedLevel3 = true
		"Reset":
			for key in Flag.s:
				Flag.s[key] = false
	
	get_tree().change_scene_to_file(NewRoom)
