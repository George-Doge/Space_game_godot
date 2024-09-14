extends Node

# For now this is empty, but it will contain some global functions, like save, laod, etc.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("save"):
		print("GAME SAVED (not really)")
		
	if event.is_action_pressed("load"):
		print("GAME LOADED (not really)")
		
	if event.is_action_pressed("pause"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
