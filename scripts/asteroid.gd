extends Node2D

@onready var debris_scene = preload("res://scenes/debris.tscn")

var health: int = 2

func spawn_debris() -> void:
	var debris_instance = debris_scene.instantiate()
	var spawn_pos: Vector2 = position
	debris_instance.position = spawn_pos

	get_parent().add_child(debris_instance)


func _on_area_2d_body_entered(body: Node2D) -> void:
	health -= 1
	body.queue_free()
	
	if health <= 0:
		spawn_debris()
		self.queue_free()
