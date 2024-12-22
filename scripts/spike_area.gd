extends RigidBody2D

class_name SpikeRigidBody2D

var move_back: MoveCharacterBack
@onready var trigger_2d: DetectTargetGroupCollision = $"../Trigger2D"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var processed: bool = false

func _ready() -> void:
	var player = get_tree().get_nodes_in_group(&"player").front()
	move_back = player.find_child("MoveCharacterBack")


func unfreeze():
	gravity_scale = 1.0
	trigger_2d.disabled = true
	disappear()


func disappear():
	await get_tree().create_timer(2.0).timeout
	queue_free()


func _on_check_collision_has_collided(collider: Object) -> void:
	if ! processed:
		processed = true
		move_back.turn_on()
