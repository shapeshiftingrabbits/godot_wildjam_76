extends Control


func _ready() -> void:
	hide()


func _on_exit_to_main_screen_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_menu_button_pressed() -> void:
	show_menu()


func show_menu():
	get_tree().paused = true
	show()


func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_cancel"):
		if visible:
			resume()
		else:
			show_menu()


func resume() -> void:
	hide()
	get_tree().paused = false


func _on_reload_current_world_pressed() -> void:
	get_tree().reload_current_scene()
