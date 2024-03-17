extends CharacterBody3D

var player_colliding = false
var dialogue_showing = false

@onready var player = $"../Escher"

@onready var storage_light = $"../WorldEnvironment/Light44"
@onready var shadowperson = $"../ShadowPerson1"
@onready var distortion_shader = $"../Distortion_Shader"

@onready var beep = $"../Audio/Beep"
@onready var shadows = $"../ShadowPerson1/shadows"

func _process(delta):
	if dialogue_showing:
		player.set_physics_process(false)

func _input(event):
	if Input.is_action_just_pressed("Spacebar") and dialogue_showing:
		shadows.play()
		player.set_physics_process(true)
		$Dialogue_Box.hide()
		hide()
		storage_light.hide()
		shadowperson.show()
		distortion_shader.show()
		dialogue_showing = false
		
		
func _on_area_3d_body_entered(body):
	if body.is_in_group("player") and is_visible():
		beep.play()
		player.set_physics_process(false)
		$Label.hide()
		player_colliding = true
		$Dialogue_Box.show()
		dialogue_showing = true


func _on_area_3d_body_exited(body):
	if body.is_in_group("player"):
		player_colliding = false
		$Label.hide()
