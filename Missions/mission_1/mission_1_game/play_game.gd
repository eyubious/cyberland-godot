extends Node2D

# timer variables
var time: float =  300.0
var mins: int = 0
var secs: int = 0
var msec: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time -= delta
	msec = fmod(time, 1) * 100
	secs = fmod(time, 60)
	mins = fmod(time, 3600) / 60
	$timer/mins.text = "%02d:" % mins
	$timer/secs.text = "%02d." % secs
	$timer/msec.text = "%03d" % msec
	
	if (mins == 0 && secs == 0 && msec == 0):
		stop()
		
func stop() -> void:
	set_process(false)
	
func format_time() -> String:
	return "%02d:%02d.%03d" % [mins, secs, msec]


func _on_game_over_btn_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_1/mission_1_game/game_end.tscn")
