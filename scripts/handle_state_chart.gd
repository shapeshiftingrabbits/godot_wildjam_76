extends Node

class_name HandleStateChart

@onready var state_chart: StateChart = $"../StateChart"
@onready var player: Player = %Player


func _on_move_character_back_player_is_moved_back() -> void:
	state_chart.set_expression_property(&"shoved_back", true)
	state_chart.set_expression_property(&"in_control", false)


func _on_move_character_back_end_move_back() -> void:
	state_chart.set_expression_property(&"shoved_back", false)
	state_chart.set_expression_property(&"in_control", true)


func set_in_control_property(in_control: bool):
	state_chart.set_expression_property(&"in_control", in_control)


func _physics_process(delta: float) -> void:
	state_chart.set_expression_property(&"velocity", player.velocity)
	state_chart.set_expression_property(&"has_input_direction", player.direction)
	state_chart.set_expression_property(&"is_on_floor", player.is_on_floor())
