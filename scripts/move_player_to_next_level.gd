extends Node

class_name MovePlayerToNextLevel

@onready var player: Player = %Player
@onready var handle_state_chart: HandleStateChart = $"../HandleStateChart"

var starting_position: Vector2
var in_progress: bool = false

func do(current_level_controller: LevelController):
	var starting_position_node = current_level_controller.find_child("StartingPosition") as Node2D
	starting_position = starting_position_node.get_global_transform().get_origin()
	handle_state_chart.set_in_control_property(false)
	in_progress = true


func _on_not_in_control_state_state_physics_processing(delta: float) -> void:
	if !in_progress: return
	if player.position.x < starting_position.x:
		player.velocity.x = player.SPEED
		player.move_and_slide()
	else:
		in_progress = false
		handle_state_chart.set_in_control_property(true)
		
	
