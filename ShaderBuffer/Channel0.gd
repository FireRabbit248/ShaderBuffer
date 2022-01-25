# inspired by https://www.youtube.com/watch?v=v48O7Nk_n4g
# Godot 3.1+ very minimal Shadertoy logic with FBO by Danil S

extends Sprite
var frame_counter = 0

func _ready():
	pass

func _process(_delta):
	if frame_counter == 1:
		# set Texture to Channel0_buf
		var new_texture = get_node("../../Channel0_buf").get_viewport().get_texture()
		set_texture(new_texture)
		frame_counter += 1
	else:
		frame_counter += 1
