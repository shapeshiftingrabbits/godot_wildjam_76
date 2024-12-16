extends Node

class_name PlayerArrivedInLevel

@export var target_collider: ToggleCollision


func _on_trigger_entered_level_body_entered(body: Node2D) -> void:
	if body.is_in_group(&"player"):
		target_collider.turn_on()
