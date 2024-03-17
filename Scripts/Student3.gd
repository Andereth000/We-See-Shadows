extends AnimatedSprite3D

@onready var physics_homework = $"../PhysicsHomeworkStacked"

@onready var player = $"../Escher"

@onready var vignette_shader = $"../Vignette_Shader"

@onready var black_screen = $"../BlackScreen"

@onready var beep = $"../Audio/Beep"
@onready var low_drone = $"../Audio/Low_Drone"

var player_colliding = false

var student_interacted_with = false

var task_done = false

func _input(event):
	if Input.is_action_just_pressed("Interact") and player_colliding and physics_homework.picked_up and !student_interacted_with:
		beep.play()
		if player.student_interacted_with == 4:
			player.set_physics_process(false)
			$Label.hide()
			$Dialogue_Box_Alternative.show()
		elif player.student_interacted_with == 5:
			low_drone.play()
			player.set_physics_process(false)
			$Label.hide()
			$Dialogue_Box_Alternative2.show()
			vignette_shader.show()
			task_done = true
		else:
			player.set_physics_process(false)
			$Label.hide()
			$Dialogue_Box2.show()
		
		player.student_interacted_with += 1
		student_interacted_with = true
		
			
			
			
				
	if Input.is_action_just_pressed("Spacebar"):
		player.set_physics_process(true)
		$Dialogue_Box2.hide()
		$Dialogue_Box_Alternative.hide()
		$Dialogue_Box_Alternative2.hide()
		if task_done:
			vignette_shader.hide()
			black_screen.show()
			$Dialogue_Box_Alternative2.hide()
			await get_tree().create_timer(10.0).timeout
			get_tree().change_scene_to_file("res://Scenes/School_Night.tscn")
		
			

func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		player_colliding = true
		$Label.show()
	

func _on_area_3d_body_exited(body):
	if body.is_in_group("player"):
		player_colliding = false
		$Label.hide()
