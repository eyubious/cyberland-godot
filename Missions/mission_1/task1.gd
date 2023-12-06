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

# Start video with slight delay to allow for adjustments
func start_video_with_delay():
	var video_player = $VideoStreamPlayer
	await get_tree().create_timer(.25).timeout # Wait for .25 second
	video_player.play()  # Play the video after the delay
