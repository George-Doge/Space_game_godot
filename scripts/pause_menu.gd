extends Control

@onready var pause_menu = $"."

func _on_resume_button_pressed() -> void:
	pause_menu.hide()
	get_tree().paused = false

func _input(event) -> void:
	if event.is_action_pressed("pause"):
		pause_menu.hide()
		get_tree().paused = false


func _on_quit_button_pressed() -> void:
	get_tree().quit()
