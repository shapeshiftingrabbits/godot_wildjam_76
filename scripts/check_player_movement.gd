extends Node

class_name CheckPlayerMovement

signal player_has_moved

@onready var player: CharacterBody2D = %Player


func is_player_frozen() -> bool:
	return player.velocity == Vector2.ZERO


func _check_player_movement(delta: float) -> void:
	if !is_player_frozen():
		player_has_moved.emit()


func _on_game_controller_leave_level(level: LevelController) -> void:
	var check_state = level.find_child("CheckState") as AtomicState
	if check_state:
		check_state.state_physics_processing.disconnect(_check_player_movement)
	


func _on_game_controller_move_to_next_level(level: LevelController) -> void:
	var check_state = level.find_child("CheckState") as AtomicState
	if check_state:
		check_state.state_physics_processing.connect(_check_player_movement)
