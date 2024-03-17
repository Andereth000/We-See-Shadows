extends MeshInstance3D

var lightswitch_on = true

var player_colliding = false

var random_time = 0

@onready var light1 = $"../WorldEnvironment/Light32"
@onready var light2 = $"../WorldEnvironment/Light33"
@onready var light3 = $"../WorldEnvironment/Light34"
@onready var light4 = $"../WorldEnvironment/Light35"

@onready var shadow_person = $"../ShadowPerson1"
@onready var mysterious_documents = $"../MysteriousDocuments"

@onready var light_switch = $"../Audio/Light_Switch"

func _ready():
	if get_tree().current_scene.name == "School_Night" or get_tree().current_scene.name == "School_Storage":
		disable_lights()
		
	random_time = randf_range(3, 8)

func _input(event):
	if Input.is_action_just_pressed("Interact") and player_colliding:
			if lightswitch_on:
				disable_lights()
				light_switch.play()
				if mysterious_documents.picked_up:
						shadow_person.show()
			else:
				enable_lights()
				light_switch.play()
				shadow_person.hide()
				shadow_person.speed = 1
				await get_tree().create_timer(random_time).timeout
				disable_lights()
				light_switch.play()
				shadow_person.speed = 4.5
				if mysterious_documents.picked_up:
					shadow_person.show()
					shadow_person.speed = 4.5
			
func disable_lights():
	light1.hide()
	light2.hide()
	light3.hide()
	light4.hide()
	lightswitch_on = false
	
func enable_lights():
	light1.show()
	light2.show()
	light3.show()
	light4.show()
	lightswitch_on = true				

func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		player_colliding = true
		$Label.show()


func _on_area_3d_body_exited(body):
	if body.is_in_group("player"):
		player_colliding = false
		$Label.hide()
