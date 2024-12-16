extends Camera2D
@onready var level_2: Node2D = $"../Level2"



func pan_to_position(target_position: Vector2):
	create_tween().tween_property(self,"offset",target_position,2.0)
	#offset = target_position


func _on_button_pressed() -> void:
	pan_to_position(level_2.position)


func _on_trigger_move_to_next_level_body_exited(body: Node2D) -> void:
	pan_to_position(level_2.position)
