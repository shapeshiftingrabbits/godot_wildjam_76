extends Node

@onready var go_instruction: HBoxContainer = $GoInstruction
@onready var stop_instruction: HBoxContainer = $StopInstruction


func _ready() -> void:
	go_instruction.hide()
	stop_instruction.hide()


func start_game():
	pass
