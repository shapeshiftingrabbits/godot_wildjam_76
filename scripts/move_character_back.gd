extends Node

class_name MoveCharacterBack

signal player_is_moved_back

@export var jump_time: float = 1.0
@onready var sprite_2d: Sprite2D = $"../Sprite2D"

@onready var player: Player = $".."

var is_moving_back = false
var has_been_thrown_in_air = false

func _on_check_player_movement_player_has_moved() -> void:
	if is_moving_back: return
	turn_on()
	player_is_moved_back.emit()
	await get_tree().create_timer(jump_time).timeout
	turn_off()


func turn_on():
	sprite_2d.rotate(PI)
	has_been_thrown_in_air = false
	is_moving_back = true
	player.is_control_on = false
	pass


func turn_off():
	is_moving_back = false
	player.is_control_on = true
	sprite_2d.rotate(-PI)
	pass


func _physics_process(delta: float) -> void:
	if !is_moving_back:
		return

	# Add the gravity.
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta
		
	player.velocity.x = -1 * player.SPEED
	print("has_been_thrown_in_air ", has_been_thrown_in_air)
	if !has_been_thrown_in_air and player.is_on_floor():
		has_been_thrown_in_air = true
		player.velocity.y = player.JUMP_VELOCITY
	
	player.move_and_slide()
	
