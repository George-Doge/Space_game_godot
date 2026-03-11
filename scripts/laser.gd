extends CharacterBody2D

const SPEED: int = 400

signal damage_signal(damage: int)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction_y = -1
	velocity.y = direction_y * SPEED

	var collision = move_and_collide(velocity*delta)
	
	if collision:
		#print("I collided with ", collision.get_collider().name)

		if collision.get_collider().name == "WorldBorder":
			despawn()


func despawn() -> void:
	self.queue_free()
