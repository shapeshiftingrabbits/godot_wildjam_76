extends Node

class_name HandleStateChart

@onready var state_chart: StateChart = $"../StateChart"
@onready var player: Player = %Player

func _ready() -> void:
	#await get_tree().create_timer(0.1).timeout
	await state_chart.ready
	state_chart.set_expression_property(&"shoved_back", false)
	
	
func _on_move_character_back_player_is_moved_back() -> void:
	state_chart.set_expression_property(&"shoved_back", true)


func _on_move_character_back_end_move_back() -> void:
	state_chart.set_expression_property(&"shoved_back", false)

func _physics_process(delta: float) -> void:
	state_chart.set_expression_property(&"velocity", player.velocity)
