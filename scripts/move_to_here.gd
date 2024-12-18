extends Node2D



@export var target_group_name: StringName = &"player"

var target: Node2D

func _ready() -> void:
	target = get_tree().get_nodes_in_group(target_group_name).front()


func do():
	var local_position = (target.get_parent() as Node2D).to_local(get_global_transform().get_origin())
	target.position.x = local_position.x
