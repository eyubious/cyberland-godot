extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	start_video_with_delay()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://cyberland_map.tscn")

#func _on_button_2_pressed():
	#var video_player = $VideoStreamPlayer
	#if video_player.is_playing():
	#	video_player.stop()  # Pause the video if it's currently playing
	#else:
	#	video_player.play()  # Resume the video if it's currently paused


func start_video_with_delay():
	var video_player = $VideoStreamPlayer
	await get_tree().create_timer(3).timeout # Wait for 3 seconds
	video_player.play()  # Play the video after the delay
