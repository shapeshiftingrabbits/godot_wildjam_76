extends Node

class_name CheckPlayerMovement


signal player_has_moved

@onready var player: CharacterBody2D = %Player

var is_checking_movement: bool = false

func is_player_frozen() -> bool:
	return player.velocity == Vector2.ZERO


func _physics_process(delta: float) -> void:
	if is_checking_movement and !is_player_frozen():
		player_has_moved.emit()


func _on_instructions_go_announced() -> void:
	is_checking_movement = false


func _on_instructions_stop_announced() -> void:
	is_checking_movement = true
