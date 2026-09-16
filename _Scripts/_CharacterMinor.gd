extends Player

@onready var sprites_2d: AnimatedSprite2D = $Sprites2D
var size: int = 1
var offset_1: int = -66.0
var offset_2: int = -92.0
var offset_3: int = -110.0

func _ready() -> void:
	can_move = false
	
	check_current_room()
	match size:
		1: 
			sprites_2d.play("egg_1")
			sprites_2d.offset.y = offset_1
		2: 
			sprites_2d.play("egg_2")
			sprites_2d.offset.y = offset_2
		3: 
			sprites_2d.play("egg_3")
			sprites_2d.offset.y = offset_3

func _on_player_detected(body: Node2D) -> void:
	can_move = true

func _on_player_left(body: Node2D) -> void:
	can_move = false
	velocity.x = 0

func check_current_room():
	match get_tree().current_scene.name:
		"Level_0_Tutorial": size = 1
		"Level_1_HarmingWinds": size = 1
		"Level_2_PressurePlates": size = 2
		"Level_3_Door": size = 3
