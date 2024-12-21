extends RigidBody2D

class_name SpikeRigidBody2D

var move_back: MoveCharacterBack
@onready var trigger_2d: DetectTargetGroupCollision = $"../Trigger2D"

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

var processed: bool = false
func _on_check_collision_has_collided(collider: Object) -> void:
	if ! processed:
		processed = true
		print("_on_body_entered")
		move_back.turn_on()
