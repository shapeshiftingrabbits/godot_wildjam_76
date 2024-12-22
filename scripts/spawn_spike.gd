extends Node2D

const SPIKE_RIGID_BODY_2D = preload("res://prefabs/spike_rigid_body_2d.tscn")
@onready var spike_position: Node2D = $SpikePosition
@onready var trigger_2d: DetectTargetGroupCollision = $Trigger2D
@onready var current_node = $SpikeRigidBody2D

func do():
	var node = SPIKE_RIGID_BODY_2D.instantiate()
	node.position.x = spike_position.position.x
	node.position.y = spike_position.position.y
	current_node = node
	add_child(node)
	trigger_2d.disabled = false


func _on_trigger_2d_target_group_entered() -> void:
	if current_node && is_instance_valid(current_node):
		current_node.unfreeze()
	else:
		current_node = null

	
