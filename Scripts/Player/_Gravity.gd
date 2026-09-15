extends Node

const GRAVITY: int = 2000
@export var player: CharacterBody2D

func _physics_process(delta: float) -> void:
	if !player.is_on_floor(): player.velocity.y += GRAVITY * delta
