extends Node3D

var player_colliding = false

var game_end = false

@onready var enemy_trigger = $"../Enemy_Trigger"

@onready var door_open = $"../Audio/Door_Open"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if Input.is_action_just_pressed("Interact") and player_colliding and enemy_trigger.enemy_triggered:
		door_open.play()
		$ColorRect.show()
		$Label.hide()
		game_end = true
	if Input.is_action_just_pressed("Spacebar") and game_end:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		player_colliding = true
		$Label.show()
	

func _on_area_3d_body_exited(body):
	if body.is_in_group("player"):
		player_colliding = false
		$Label.hide()
