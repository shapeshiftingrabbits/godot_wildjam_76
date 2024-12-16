extends Node

class_name MoveToNextLevel

@export var target_collider: ToggleCollision


func _on_trigger_move_to_next_level_body_entered(body: Node2D) -> void:
	if body.is_in_group(&"player"):
		target_collider.turn_off()
