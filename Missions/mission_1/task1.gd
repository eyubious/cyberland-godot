extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://cyberland_map.tscn")


func _on_button_2_pressed():
	var video_player = $VideoStreamPlayer # Assuming the VideoPlayer node is named "VideoStreamPlayer"
	
	if video_player.is_playing():
		video_player.stop()  # Pause the video if it's currently playing
	else:
		video_player.play()  # Unpause the video if it's currently paused
