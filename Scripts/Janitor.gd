extends CharacterBody3D

var player_colliding = false
var current_dialogue = 1
var max_dialogue = 7
var dialogue_started = false

@onready var player = $"../Escher"

@onready var beep = $"../Audio/Beep"

func _process(delta):
	if Input.is_action_just_pressed("Spacebar") and dialogue_started:
		hide_current_dialogue()
		current_dialogue += 1
		start_dialogue()

func _input(event):
	if Input.is_action_just_pressed("Interact") and player_colliding and current_dialogue != 8:
		beep.play()
		$Label.hide()
		player.set_physics_process(false)
		start_dialogue()
		dialogue_started = true
	else:
		if current_dialogue > 7:
			player.set_physics_process(true)
			player.has_key = true
				
		
		
func start_dialogue():
	if current_dialogue <= max_dialogue:
		match current_dialogue:
			1:
				$Dialogue_Box.show()
			2:
				$Dialogue_Box2.show()
			3:
				$Dialogue_Box3.show()
			4:
				$Dialogue_Box4.show()
			5:
				$Dialogue_Box5.show()
			6:
				$Dialogue_Box6.show()
			7:
				$Dialogue_Box7.show()
		
func hide_current_dialogue():
	match current_dialogue:
		1:
			$Dialogue_Box.hide()
			beep.play()
		2:
			$Dialogue_Box2.hide()
			beep.play()
		3:
			$Dialogue_Box3.hide()
			beep.play()
		4:
			$Dialogue_Box4.hide()
			beep.play()
		5:
			$Dialogue_Box5.hide()
			beep.play()
		6:
			$Dialogue_Box6.hide()
			beep.play()
		7:
			$Dialogue_Box7.hide()
		
func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		player_colliding = true
		$Label.show()


func _on_area_3d_body_exited(body):
	if body.is_in_group("player"):
		player_colliding = false
		$Label.hide()
