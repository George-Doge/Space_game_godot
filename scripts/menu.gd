extends Control

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_controls_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu_scenes/controls.tscn")

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu_scenes/license.tscn")

func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu_scenes/credits.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
