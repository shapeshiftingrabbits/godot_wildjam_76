extends Node

class_name DetectFinishLineReached


signal finished_line_reached

func _on_finish_line_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group(&"player"):
		finished_line_reached.emit()
		print("win")
