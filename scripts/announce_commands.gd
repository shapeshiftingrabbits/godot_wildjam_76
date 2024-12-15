extends Node

class_name AnnounceCommands

@onready var instructions: Instructions = %Instructions
@onready var timer: Timer = $Timer
@onready var check_player_movement: CheckPlayerMovement = $"../CheckPlayerMovement"
@onready var state_chart: StateChart = $"../StateChart"



func _on_detect_starting_line_reached_entered_play_area() -> void:
	start_game()

func start_game():
	state_chart.send_event(&"started")
	timer.start()

func _on_timer_timeout() -> void:
	state_chart.send_event(&"next")


func _on_detect_finish_line_reached_finished_line_reached() -> void:
	timer.stop()
	state_chart.send_event(&"idled")
