extends Node

# For now this is empty, but it will contain some global functions, like save, laod, etc.


func _ready() -> void:
	%PauseMenu.hide()

func _input(event) -> void:
	if event.is_action_pressed("save"):
		print("GAME SAVED (not really)")
		
	if event.is_action_pressed("load"):
		print("GAME LOADED (not really)")
		
	if event.is_action_pressed("pause"):
		%PauseMenu.show()
		get_tree().paused = true
