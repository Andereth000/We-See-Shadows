extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D
@onready var player = $"../Escher"
@onready var shadowperson = $"."
@onready var main_entrance = $"../MainEntrance"

var player_dead = false

var player_colliding = false

var speed = 4.5

@onready var distortion_shader = $"../Distortion_Shader"

@onready var space_distortion = $"../Audio/space_distortion"

func _physics_process(_delta):
	var current_location = get_global_transform().origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * speed
	
	velocity = new_velocity
	move_and_slide()
	
func update_target_location(target_location):
	nav_agent.target_position = target_location
	
	
func _on_area_3d_body_entered(body):
	if body.is_in_group("player") and shadowperson.is_visible():
		player_colliding = true
		space_distortion.play()
		distortion_shader.show()


func _on_area_3d_body_exited(body):
	if body.is_in_group("player"):
		player_colliding = false
		space_distortion.stop()
		distortion_shader.hide()


func _on_navigation_agent_3d_target_reached():
	$ColorRect.show()
	player_dead = true
	if Input.is_action_just_pressed("Spacebar") and player_dead and !main_entrance.game_end:
		get_tree().change_scene_to_file("res://Scenes/School_Storage.tscn")
