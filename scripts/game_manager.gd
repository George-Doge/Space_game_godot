extends Node

# For now this is empty, but it will contain some global functions, like save, laod, etc.

# SAVE/LOAD VARIABLES
const SAVE_PATH: String = "res://saveGame.json"

var save_dict: Dictionary = {
	"playerENERGY": 100,
	"playerSTORAGE": 0,
	"playerCREDITS": 50
}

signal energy_load(energy: int)
signal credits_load(credits: int)
signal storage_load(storage: int)

func _ready() -> void:
	%PauseMenu.hide()

func SaveGame() -> void:
	print("GAME SAVED")
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)

	var jstr = JSON.stringify(save_dict, "\t")
	file.store_line(jstr)

func LoadGame() -> void:
	print("GAME LOADED")
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) != true:
		print("Save file Not found")
	else:
		var load_data: String = file.get_as_text()
		var json = JSON.new()
		var error = json.parse(load_data)
		if error != OK:
			print("Error while loading save")
		else:
			var data_received = json.data
			if typeof(data_received) == TYPE_DICTIONARY:
				send_load(data_received) # return dictionary
			else:
				print("Error")


# this function reads loaded data and send signals to the player
func send_load(data: Dictionary) -> void:
	emit_signal("energy_load", data["playerENERGY"])
	emit_signal("credits_load", data["playerCREDITS"])
	emit_signal("storage_load", data["playerSTORAGE"])

func _input(event) -> void:
	if event.is_action_pressed("save"):
		SaveGame()

	if event.is_action_pressed("load"):
		LoadGame()

	if event.is_action_pressed("pause"):
		%PauseMenu.show()
		get_tree().paused = true


func _on_ship_credits_change(credits: int) -> void:
	save_dict["playerCREDITS"] = credits

func _on_ship_energy_change(energy: int) -> void:
	save_dict["playerENERGY"] = energy

func _on_ship_storage_change(storage: int) -> void:
	save_dict["playerSTORAGE"] = storage
