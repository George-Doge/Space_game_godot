extends Control

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
func _input(event) -> void:
	if event.is_action_pressed("pause"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
