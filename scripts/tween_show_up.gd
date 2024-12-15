extends Node2D

@onready var player: Player = %Player

var is_animating: bool = false


func animate():
	if is_animating: return
	is_animating = true
	position.x = player.position.x
	var show_up_tween: Tween = get_tree().create_tween()
	var current_y = position.y
	show_up_tween.tween_property( self, "position", Vector2( position.x, current_y - 120.0), 0.3)
	show_up_tween.tween_property( self, "position", Vector2( position.x, current_y), 0.3)
	show_up_tween.tween_callback(func (): is_animating = false)


func _on_move_character_back_player_is_moved_back() -> void:
	animate()
	pass # Replace with function body.
