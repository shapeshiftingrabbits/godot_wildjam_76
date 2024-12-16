extends Node

class_name HandleCharacterOrientation
@onready var sprite_2d: Sprite2D = $"../Sprite2D"
@onready var player: Player = %Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_walk_state_physics_processing(delta: float) -> void:
	update_orientation()


func _on_jump_state_physics_processing(delta: float) -> void:
	update_orientation()


func update_orientation():
	sprite_2d.flip_h = player.velocity.x < 0
