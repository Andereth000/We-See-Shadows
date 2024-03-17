extends Control

@onready var beep = $Beep

func _ready():
	$Settings.hide()

func _on_new_game_pressed():
	beep.play()
	get_tree().change_scene_to_file("res://Scenes/intro_cutscene.tscn")
	

func _on_settings_pressed():
	beep.play()
	$Main.hide()
	$Settings.show()
	

func _on_exit_pressed():
	get_tree().quit()

func _on_toggle_fullscreen_toggled(toggled_on):
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_enable_v_sync_toggled(toggled_on):
	if DisplayServer.window_get_vsync_mode() == DisplayServer.VSYNC_ENABLED:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
		

func _on_back_pressed():
	beep.play()
	$Settings.hide()
	$Main.show()
