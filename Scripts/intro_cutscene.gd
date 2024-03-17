extends Control

var animation_playing = true

@onready var beep = $Beep

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("text_1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		beep.play()
		get_tree().change_scene_to_file("res://Scenes/School.tscn")
	

