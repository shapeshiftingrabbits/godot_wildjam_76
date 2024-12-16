extends Node

class_name HandleCharacterOrientation

@onready var player: Player = %Player
@onready var character_sprite: Sprite2D = %CharacterSprite


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
	character_sprite.flip_h = player.velocity.x < 0