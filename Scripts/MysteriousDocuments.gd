extends MeshInstance3D

var player_colliding = false

var picked_up = false

@onready var player = $"../Escher"

@onready var janitor1 = $"../Janitor"
@onready var janitor2 = $"../Janitor2"

@onready var pickup_paper = $"../Audio/Pickup_Paper"
@onready var disturbing_low = $"../Audio/Disturbing_low"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if Input.is_action_just_pressed("Interact") and player_colliding:
		pickup_paper.play()
		disturbing_low.play()
		$".".hide()
		picked_up = true
		janitor1.hide()
		janitor2.show()
		$Label.hide()
		$"Maria's Note".show()
		player.set_physics_process(false)
		
	if Input.is_action_just_pressed("Spacebar"):
		player.set_physics_process(true)
		$"Maria's Note".hide()


func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		player_colliding = true
		$Label.show()


func _on_area_3d_body_exited(body):
	if body.is_in_group("player"):
		player_colliding = false
		$Label.hide()
