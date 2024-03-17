extends CharacterBody3D

@onready var background_camera = $base_camera/background_viewport_container/background_viewport/background_camera
@onready var foreground_camera = $base_camera/background_viewport_container/foreground_viewport_container/foreground_viewport/foreground_camera

var student_interacted_with = 0

var doors_locked = 0

var dialogue_active = false

var dialogue_ended = false

var has_key = false

const SPEED = 5.0
# const JUMP_VELOCITY = 4.5

@onready var camera_point = $camera_point

@onready var beep = $"../Audio/Beep"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _process(delta):
	if Input.is_action_just_pressed("Spacebar"):
		if !dialogue_active and !dialogue_ended:
			start_dialogue()
		elif $Dialogue_Box2.is_visible():
			hide_dialogue()
			set_physics_process(true)
		
func _ready():
	GameManager.set_player(self)
	if get_tree().current_scene.name == "School_Night":
		$Dialogue_Box.show()
		set_physics_process(false)
	if get_tree().current_scene.name == "School_Storage":
		has_key = true
		doors_locked = 4

func hide_dialogue():
	if get_tree().current_scene.name == "School_Night":
		$Dialogue_Box2.hide()
		dialogue_active = false
		dialogue_ended = true

func start_dialogue():
	if get_tree().current_scene.name == "School_Night":
		beep.play()
		$Dialogue_Box.hide()
		set_physics_process(false)
		$Dialogue_Box2.show()
		dialogue_active = true
		dialogue_ended = false
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		# velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right", "Forward", "Backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if Input.is_action_just_pressed("Forward"):
		$AnimatedSprite3D.frame = 4
		
	if Input.is_action_just_pressed("Forward") and Input.is_action_just_pressed("Right"):
		$AnimatedSprite3D.frame = 5
		
	if Input.is_action_just_pressed("Backward"):
		$AnimatedSprite3D.frame = 0
		
	if Input.is_action_just_pressed("Left"):
		$AnimatedSprite3D.frame = 2	
		
	if Input.is_action_just_pressed("Right"):
		$AnimatedSprite3D.frame = 6

	move_and_slide()
	
