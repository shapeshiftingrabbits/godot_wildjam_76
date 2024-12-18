extends Node

class_name GameController

signal move_to_next_level(level: LevelController)

# Level name need to be sortable by name in ascending order
var level_controllers: Array[Node]
var current_level_controller: LevelController
var current_level_controller_index: int = 0

func _ready() -> void:
	level_controllers = get_tree().current_scene.find_children("*","LevelController")
	level_controllers.sort()
	current_level_controller = level_controllers.front()
	current_level_controller_index = 0
	level_controllers.map( func (level_controller: LevelController): level_controller.level_exited.connect(_moving_to_next_level))


func _moving_to_next_level():
	if ! current_level_controller_index < level_controllers.size():
		return
	current_level_controller_index += 1
	var next_level: LevelController = level_controllers[current_level_controller_index]
	next_level.enter_level()
	current_level_controller = next_level
	move_to_next_level.emit(current_level_controller)


func reset_current_level() -> void:
	current_level_controller.reset_level()
