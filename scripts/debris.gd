extends Node2D


var value: int = 10



func _on_area_2d_body_entered(body: Node2D) -> void:
	self.queue_free()
