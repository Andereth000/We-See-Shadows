extends MeshInstance3D

var player_colliding = false

var door_open = false

var layer = 0

var door_locked = false

@onready var player = $"../../Escher"

@onready var v_door = $"../V_Door"

@onready var door_opened = $"../../Audio/Door_Open"
@onready var door_close = $"../../Audio/Door_Close"
@onready var door_lock = $"../../Audio/Door_Lock"

func _ready():
	if get_tree().current_scene.name == "School":
		lock_door()
	else:
		unlock_door()

func _input(event):
	if Input.is_action_just_pressed("Interact") and !door_locked:
		if player_colliding == true and $AnimationPlayer.is_playing() == false:
			door_open = !door_open
			if door_open == true:
				$AnimationPlayer.play("Open_Door")
				door_opened.play()
			else:
				$AnimationPlayer.play("Close_Door")
				door_close.play()
				
	if Input.is_action_just_pressed("Interact") and door_locked and player_colliding:
		door_lock.play()
				
func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		player_colliding = true
		$Label.show()
		

func _on_area_3d_body_exited(body):
	if body.is_in_group("player"):
		player_colliding = false
		$Label.hide()

# Move layer
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):		
	if GameManager.player.position.z > position.z:
		set_to_background()
	else:
		if GameManager.player.position.z > position.z and !v_door.is_in_group("V_Door"):
			set_to_foreground()

func set_to_foreground():
	if layer != 2:
		layer = 2
		set_layer_mask_value(1, false)
		set_layer_mask_value(2, true)
	
func set_to_background():
	if layer != 1:
		layer = 1
		set_layer_mask_value(1, true)
		set_layer_mask_value(2, false)
		
func lock_door():
	door_locked = true
	
func unlock_door():
	door_locked = false		
