extends Node

class_name AnnounceCommands

@onready var instructions: Instructions = %Instructions
@onready var timer: Timer = $Timer
@onready var check_player_movement: CheckPlayerMovement = $"../CheckPlayerMovement"


func start_game():
	timer.start()
	instructions.show_go()


func _on_timer_timeout() -> void:
	#print(check_player_movement.is_player_frozen())
	instructions.swap_command()


func _on_detect_starting_line_reached_entered_play_area() -> void:
	start_game()
	pass # Replace with function body.


func _on_detect_finish_line_reached_finished_line_reached() -> void:
	timer.stop()
	instructions.hide_instructions()
	pass # Replace with function body.