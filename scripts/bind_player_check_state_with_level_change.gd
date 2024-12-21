extends Node

class_name BindPlayerCheckState

@onready var check_state: AtomicState = $"../StateChart/CompoundState/GoState/CheckState"

var check_player_movement: CheckPlayerMovement

func _ready() -> void:
	var player = get_tree().get_nodes_in_group(&"player").front()
	check_player_movement = player.find_child("CheckPlayerMovement")


func _on_level_entered() -> void:
	check_state.state_physics_processing.connect(check_player_movement.do)


func _on_level_exited() -> void:
	check_state.state_physics_processing.disconnect(check_player_movement.do)
