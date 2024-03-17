extends MeshInstance3D

var player_colliding = false

var picked_up = false

@onready var spin_box = $"../SpinBox"

@onready var pickup_paper = $"../Audio/Pickup_Paper"

func _input(event):
	if Input.is_action_just_pressed("Interact") and player_colliding:
		$Homework_Counter.show()
		$".".hide()
		pickup_paper.play()
		picked_up = true
		$Label.hide()

func _on_area_3d_body_entered(body):
	if body.is_in_group("player") and !picked_up:
		player_colliding = true
		$Label.show()
	

func _on_area_3d_body_exited(body):
	if body.is_in_group("player"):
		player_colliding = false
		$Label.hide()
