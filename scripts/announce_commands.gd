extends Node

class_name AnnounceCommands

@onready var state_chart: StateChart = $"../StateChart"


func _on_detect_starting_line_reached_entered_play_area() -> void:
	start_game()


func start_game():
	state_chart.send_event(&"started")


func reset_game():
	state_chart.send_event(&"idled")


func _on_detect_finish_line_reached_finished_line_reached() -> void:
	state_chart.send_event(&"ended")
