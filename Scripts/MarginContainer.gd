extends MarginContainer

func _on_new_game_button_down():
	get_tree().change_scene_to_file("res://Scenes/intro_cutscene.tscn")
	
	


func _on_settings_button_down():
	pass # Replace with function body.
	
	
	


func _on_quit_button_down():
	get_tree().quit()
