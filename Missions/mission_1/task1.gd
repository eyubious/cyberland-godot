extends Node2D

var video_player : VideoStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	
	start_video_with_delay()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_1/mission_1_game/game.tscn")

#code if you want play/stop but if you resume video will start all over.
#func _on_button_2_pressed():
#	var video_player = $VideoStreamPlayer
#	if video_player.is_playing():
#		video_player.stop()  # Pause the video if it's currently playing
#	else:
#		video_player.play()  # Resume the video if it's currently paused
	
#TODO find a way to make button appear after video is done 


func start_video_with_delay():
	var video_player = $VideoStreamPlayer
	await get_tree().create_timer(1).timeout # Wait for 1 seconds
	video_player.play()  # Play the video after the delay


func _on_back_pressed():
	get_tree().change_scene_to_file("res://cyberland_map.tscn")
