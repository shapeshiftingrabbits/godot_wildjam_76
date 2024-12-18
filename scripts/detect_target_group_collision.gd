extends Node

class_name DetectTargetGroupCollision

signal target_group_entered

@export var target_group_name: StringName = &"player"


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(target_group_name):
		target_group_entered.emit()
