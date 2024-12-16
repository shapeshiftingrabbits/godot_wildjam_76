extends Control

class_name Instructions

@onready var go_instruction: HBoxContainer = $GoInstruction
@onready var stop_instruction: HBoxContainer = $StopInstruction
@onready var warning_instruction: HBoxContainer = $WarningInstruction


func _ready() -> void:
	hide()


func _on_go_state_state_entered() -> void:
	show()
	go_instruction.show()
	stop_instruction.hide()
	warning_instruction.hide()


func _on_warning_state_state_entered() -> void:
	go_instruction.hide()
	stop_instruction.hide()
	warning_instruction.show()


func _on_stop_state_state_entered() -> void:
	go_instruction.hide()
	stop_instruction.show()
	warning_instruction.hide()


func _on_ended_state_state_entered() -> void:
	hide()
