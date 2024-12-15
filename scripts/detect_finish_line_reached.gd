extends Node

class_name DetectFinishLineReached


func _on_finish_line_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group(&"player"):
		print("win")
