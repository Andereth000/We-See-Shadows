extends Label

@onready var player = $"../../Escher"

@onready var homework_counter

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	homework_counter = player.student_interacted_with
	text = "Homework passed out: %s / 6" % homework_counter
