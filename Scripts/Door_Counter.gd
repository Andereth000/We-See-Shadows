extends Label

@onready var player = $"../../Escher"
@onready var dialogue_box3 = $"../Dialogue_Box3"

@onready var door_counter

@onready var doubledoor1 = $"../../DoubleDoor1/AnimationPlayer"
@onready var doubledoor2 = $"../../DoubleDoor2/AnimationPlayer"
@onready var doubledoor3 = $"../../DoubleDoor3/AnimationPlayer"
@onready var doubledoor4 = $"../../DoubleDoor4/AnimationPlayer"

@onready var door_crash = $"../../Audio/Door_Crash"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	if Input.is_action_just_pressed("Spacebar"):
		player.set_physics_process(true)
		dialogue_box3.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	door_counter = player.doors_locked
	text = "Doors Locked: %s / 3" % door_counter
	
	if player.has_key and player.doors_locked <= 3:
		show()
	
	if get_tree().current_scene.name == "School_Night":
		if player.doors_locked == 3:
			player.set_physics_process(false)
			doubledoor1.play("close_door")
			doubledoor2.play("close_door")
			doubledoor3.play("close_door")
			doubledoor4.play("close_door")
			player.doors_locked = 4
			hide()
			door_crash.play()
			await get_tree().create_timer(2.0).timeout
			dialogue_box3.show()
	

