extends CharacterBody2D

@export var SPEED: int = 300

var energy: int = 100
var storage: int = 0
var credits: int = 50

# signals for value change
signal energy_change(energy: int)
signal credits_change(credits: int)
signal storage_change(storage: int)

@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# movement left-right
	var direction_x = Input.get_axis("move_left", "move_right")
	var direction_y = Input.get_axis("move_up", "move_down")
	if direction_x or direction_y:
		velocity.x = direction_x * SPEED
		velocity.y = direction_y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	# handle animation
	if direction_x == 0 and direction_y == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("movement")

	# for now here is a signal which is emmited to UI so it could show UI, place this signals everywhere 
	# the vaules change
	emit_signal("energy_change", energy)
	emit_signal("storage_change", storage)
	emit_signal("credits_change", credits)
	
	move_and_slide()
