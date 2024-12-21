extends Node

class_name BindPlayerMoveToNextLevel

@onready var check_state: AtomicState = $"../StateChart/CompoundState/GoState/CheckState"

var move_to_next_level: MovePlayerToNextLevel

func _ready() -> void:
	var player = get_tree().get_nodes_in_group(&"player").front()
	move_to_next_level = player.find_child("MovePlayerToNextLevel")


func _on_game_controller_move_to_next_level(level: LevelController) -> void:
	move_to_next_level.do(level)
