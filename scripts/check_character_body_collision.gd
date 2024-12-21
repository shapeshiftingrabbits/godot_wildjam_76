extends Node

class_name CheckCollision

signal has_collided(collider: Object)

var character_body: CharacterBody2D
@export var check_groups: Array[String] = []

func _ready() -> void:
	character_body= get_tree().get_nodes_in_group(&"player").front()

func _physics_process(_delta: float) -> void:
	_check_collision()


func _check_collision():
	if (!character_body):
		return
	var slide_count = character_body.get_slide_collision_count()
	for i in slide_count:
		var colliding_object = character_body.get_slide_collision(i)
		var collider = colliding_object.get_collider() as Node
		if (check_groups.any(func (group_name: String): return collider.is_in_group(group_name))):
			has_collided.emit(collider)
