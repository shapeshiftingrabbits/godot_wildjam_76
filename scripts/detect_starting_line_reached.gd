extends Node

class_name DetectStartingLineReached

signal entered_play_area

func _on_starting_line_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group(&"player"):
		entered_play_area.emit()
		print("start")
