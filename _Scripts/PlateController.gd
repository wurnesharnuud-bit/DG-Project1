extends Node2D

# To set new room, R-Click level scene
# and click "copy path", then paste
# into export variable 
@export var NewRoom: String
@export var button_1: Area2D
@export var button_2: Area2D

func _process(_delta: float) -> void:
	if button_1.pressed && button_2.pressed:
		get_tree().change_scene_to_file(NewRoom)
