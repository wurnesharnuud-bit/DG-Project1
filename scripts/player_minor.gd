extends Player

func _ready() -> void:
	can_move = false

func _on_player_detected(body: Node2D) -> void:
	can_move = true

func _on_player_left(body: Node2D) -> void:
	can_move = false
	velocity.x = 0
