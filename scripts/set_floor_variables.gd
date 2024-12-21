extends Node

class_name SetFloorVariablesToPlayer

@export_range(0.0,1.0) var deceleration = 0.1

var player: Player
var cached_deceleration: float


func _ready() -> void:
	player = get_tree().get_nodes_in_group(&"player").front()

func _on_ice_zone_trigger_2d_target_group_entered() -> void:
	cached_deceleration = player.deceleration
	player.deceleration = deceleration


func _on_ice_zone_trigger_2d_target_group_exited() -> void:
	player.deceleration = cached_deceleration
