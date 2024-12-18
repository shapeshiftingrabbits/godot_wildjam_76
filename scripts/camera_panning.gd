extends Camera2D


func _on_game_controller_move_to_next_level(level: LevelController) -> void:
	pan_to_position(level.position)


func pan_to_position(target_position: Vector2):
	create_tween().tween_property(self,"offset",target_position,2.0)
