extends Node

class_name DetectTargetGroupCollision

signal target_group_entered

@export var target_group_name: StringName = &"player"

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@export var disabled: bool = false

func _ready() -> void:
	collision_shape_2d.set_deferred("disabled", disabled)
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(target_group_name):
		target_group_entered.emit()
