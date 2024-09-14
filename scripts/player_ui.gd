extends CanvasLayer

# The UI listens for signals from Player (or ship.tscn) every time the value changes

func _on_ship_energy_change(energy: int) -> void:
	$EnergyBar/EnergyLabel.hide()
	$EnergyBar.value = energy
	
	if energy <= 30:
		$EnergyBar/EnergyLabel.text = "LOW ENERGY"
		$EnergyBar/EnergyLabel.show()
	
	elif energy <= 0:
		$EnergyBar/EnergyLabel.text = "NO ENERGY"
		$EnergyBar/EnergyLabel.show()
		
		
func _on_ship_storage_change(storage: int) -> void:
	$StorageBar/StorageLabel.hide()
	$StorageBar.value = storage
	
	if storage >= 65 and storage < 100:
		$StorageBar/StorageLabel.text = "LOW STORAGE"
		$StorageBar/StorageLabel.show()
	
	elif storage >= 100:
		$StorageBar/StorageLabel.text = "FULL STORAGE"
		$StorageBar/StorageLabel.show()

func _on_ship_credits_change(credits: int) -> void:
	$CreditsBar/Label.text = str(credits)
