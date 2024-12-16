extends Node

class_name HandleStateChart

@onready var state_chart: StateChart = $"../StateChart"


func _on_move_character_back_player_is_moved_back() -> void:
	state_chart.set_expression_property(&"shoved_back", true)


func _on_move_character_back_end_move_back() -> void:
	state_chart.set_expression_property(&"shoved_back", false)
