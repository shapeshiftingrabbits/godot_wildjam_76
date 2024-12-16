extends StaticBody2D

class_name ToggleCollision

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func turn_off():
	#collision_shape_2d.disabled = true
	set_deferred("disabled", true)
	hide()
	collision_shape_2d.set_deferred("disabled", true)
	
func turn_on():
	#collision_shape_2d.disabled = false
	collision_shape_2d.set_deferred("disabled", false)
	show()