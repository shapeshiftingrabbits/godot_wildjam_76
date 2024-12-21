extends Node

class_name CheckPlayerMovement

signal player_has_moved

@onready var player: Player = $".."


func do(delta: float) -> void:
	if !is_player_frozen():
		player_has_moved.emit()


func is_player_frozen() -> bool:
	return player.velocity == Vector2.ZERO
