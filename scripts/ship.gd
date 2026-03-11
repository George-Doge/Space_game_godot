extends CharacterBody2D

@export var SPEED: int = 300

var energy: int = 100
var storage: int = 5
var credits: int = 50


# signals for value change
signal energy_change(energy: int)
signal credits_change(credits: int)
signal storage_change(storage: int)

@onready var animated_sprite = $AnimatedSprite2D
@onready var Laser_scene = preload("res://scenes/laser.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_ship()
	
	if energy <= 0:
		animated_sprite.play("no_power")

	# for now here is a signal which is emmited to UI so it could show UI, place this signals everywhere 
	# the vaules change
	emit_signal("energy_change", energy)
	emit_signal("storage_change", storage)
	emit_signal("credits_change", credits)



func _input(event) -> void:
	if event.is_action_pressed("shoot"):
		shoot()


func shoot() -> void:
	var laser_instance = Laser_scene.instantiate()
	
	var spawn_pos: Vector2 = position
	spawn_pos[1] -= 50
	laser_instance.position = spawn_pos

	laser_instance.velocity = Vector2(0, -10)
	
	get_parent().add_child(laser_instance)


func move_ship() -> void:
	# movement left-right
	var direction_x = Input.get_axis("move_left", "move_right")
	var direction_y = Input.get_axis("move_up", "move_down")
	if (direction_x or direction_y) and energy > 0:
		velocity.x = direction_x * SPEED
		velocity.y = direction_y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	# handle animation
	if (direction_x == 0 and direction_y == 0):
		animated_sprite.play("idle")

	else:
		animated_sprite.play("movement")
		# TODO UNCOMMENT energy -= 1
		
	move_and_slide()

func _on_game_manager_credits_load(new_credits: int) -> void:
	credits = new_credits


func _on_game_manager_energy_load(new_energy: int) -> void:
	energy = new_energy


func _on_game_manager_storage_load(new_storage: int) -> void:
	storage = new_storage

func _on_debris_value_added(value: int) -> void:
	credits += value
