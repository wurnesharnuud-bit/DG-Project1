extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var pressed: bool = false

func _on_body_entered(body: Node2D) -> void:
	animated_sprite.play("pressed")
	pressed = true
func _on_body_exited(body: Node2D) -> void:
	animated_sprite.play("default")
	pressed = false
