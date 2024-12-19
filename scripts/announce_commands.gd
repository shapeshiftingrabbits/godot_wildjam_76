extends Node

class_name AnnounceCommands

@onready var state_chart: StateChart = $"../StateChart"

@onready var first_timer: Timer = $FirstTimer
@onready var second_timer: Timer = $SecondTimer
@onready var third_timer: Timer = $ThirdTimer
@onready var soleil_timer: Timer = $SoleilTimer
@onready var check_timer: Timer = $CheckTimer

#@onready var game_timers: Array[Timer] = [first_timer, second_timer, third_timer, soleil_timer]
#@onready var all_timers: Array[Timer] = game_timers + [check_timer]


func _on_detect_starting_line_reached_entered_play_area() -> void:
	start_game()


func reset_game():
	#all_timers.map(func (timer): timer.stop())
	state_chart.send_event(&"idled")


func start_game():
	state_chart.send_event(&"started")
	#game_timers.map(func (timer): timer.start())


func _on_detect_finish_line_reached_finished_line_reached() -> void:
	#all_timers.map(func (timer): timer.stop())
	state_chart.send_event(&"ended")
