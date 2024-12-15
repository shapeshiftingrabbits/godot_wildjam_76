extends Control

class_name Instructions

@onready var go_instruction: HBoxContainer = $GoInstruction
@onready var stop_instruction: HBoxContainer = $StopInstruction


func _ready() -> void:
	show()
	go_instruction.hide()
	stop_instruction.hide()


func show_go():
	go_instruction.show()
	stop_instruction.hide()


func show_stop():
	go_instruction.hide()
	stop_instruction.show()


func hide_instructions():
	go_instruction.hide()
	stop_instruction.hide()
	hide()

func swap_command():
	if go_instruction.visible:
		show_stop()
	else:
		show_go()
