extends Camera3D

var zoom_min = 0.6
var zoom_max = 1.0
var zoom_speed = 0.05
var des_zoom = 1.0

func _process(_delta):
	fov = lerp(fov, des_zoom * 90, 0.2)

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				if des_zoom > zoom_min:
					des_zoom -= zoom_speed
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				if des_zoom < zoom_max:
					des_zoom += zoom_speed
