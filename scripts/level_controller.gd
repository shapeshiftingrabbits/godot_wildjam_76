extends Node2D

class_name LevelController

signal level_entered
signal level_exited
signal reset


func enter_level():
	level_entered.emit()


func exit_level():
	level_exited.emit()


func reset_level():
	reset.emit()
