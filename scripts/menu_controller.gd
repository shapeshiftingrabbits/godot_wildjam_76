extends Control


func _ready() -> void:
	hide()


func _on_exit_to_main_screen_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_menu_button_pressed() -> void:
	get_tree().paused = true
	show()


func _input(event: InputEvent) -> void:
	if event.is_action("ui_cancel"):
		resume()


func resume() -> void:
	hide()
	get_tree().paused = false
