extends Node2D

var player: Player 

var is_animating: bool = false


func _ready() -> void:
	player = get_tree().get_nodes_in_group(&"player").front()


func animate():
	if is_animating: return
	is_animating = true
	var player_global_position = player.get_global_transform().get_origin()
	position.x = get_parent().to_local(player_global_position).x
	var show_up_tween: Tween = get_tree().create_tween()
	var current_y = position.y
	show_up_tween.tween_property( self, "position", Vector2( position.x, current_y - 120.0), 0.3)
	show_up_tween.tween_property( self, "position", Vector2( position.x, current_y), 0.3)
	show_up_tween.tween_callback(func (): is_animating = false)


func _on_level_entered() -> void:
	print("_on_level_entered")
	var state = player.find_child(&"ShovedBack") as AtomicState
	if state:
		state.state_entered.connect(animate)


func _on_level_exited() -> void:
	print("_on_level_exited")
	var state = player.find_child(&"ShovedBack") as AtomicState
	if state:
		state.state_exited.disconnect(animate)
