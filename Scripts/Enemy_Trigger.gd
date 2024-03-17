extends Area3D

var player_colliding = false
var enemy_triggered = false

@onready var mysterious_documents = $"../MysteriousDocuments"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mysterious_documents.picked_up:
		monitoring = true


func _on_body_entered(body):
	if body.is_in_group("player"):
		player_colliding = true
		enemy_triggered = true


func _on_body_exited(body):
	if body.is_in_group("player"):
		player_colliding = false
