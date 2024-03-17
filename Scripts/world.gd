extends Node3D

@onready var player = $Escher

@onready var enemy_trigger = $Enemy_Trigger

@onready var quiet_roomtone = $Audio/Quiet_Roomtone

var paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
		
	
	if get_tree().current_scene.name == "School_Night" or get_tree().current_scene.name == "School_Storage":
		if enemy_trigger.enemy_triggered and is_visible():
			get_tree().call_group("enemy", "update_target_location", player.get_global_transform().origin)
	

func _on_quiet_roomtone_finished():
	if get_tree().current_scene.name == "School":
		quiet_roomtone.play()
