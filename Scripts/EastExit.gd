extends Node3D

var player_colliding = false

var door_locked = false

@onready var player = $"../Escher"

@onready var door_lock = $"../Audio/Door_Lock"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_action_just_pressed("Interact") and player_colliding and player.has_key and !door_locked:
		door_lock.play()
		player.doors_locked += 1
		door_locked = true

func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		player_colliding = true
		$Label.show()
	

func _on_area_3d_body_exited(body):
	if body.is_in_group("player"):
		player_colliding = false
		$Label.hide()
