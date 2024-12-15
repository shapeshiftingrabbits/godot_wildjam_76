extends Node

class_name CheckPlayerMovement

signal player_has_moved

@onready var player: CharacterBody2D = %Player


func _on_stop_state_state_physics_processing(delta: float) -> void:
	if !is_player_frozen():
		player_has_moved.emit()


func is_player_frozen() -> bool:
	return player.velocity == Vector2.ZERO
