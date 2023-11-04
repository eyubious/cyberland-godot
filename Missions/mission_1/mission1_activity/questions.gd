extends Node2D

# timer variables
var time: float = 10.0
var mins: int = 0
var secs: int = 0
var msec: int = 0

# question variables
@onready var displayQuestion = $question
@onready var displayDesc = $description
@onready var showResultBtn = $showResult
@onready var nextBtn = $nextBtn

var dict = read_file("res://Missions/mission_1/mission1_activity/questions_answers.json")
var item: Dictionary
var item_index: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	refresh_screen()
	
func refresh_screen():
	showResultBtn.hide()
	nextBtn.hide()
	if item_index >= dict.size():
		show_description()
	else:
		show_question()

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
		show_description()

func stop() -> void:
	set_process(false)

func format_time() -> String:
	return "%02d:%02d.%03d" % [mins, secs, msec]
		
func show_description():
	item = dict[item_index]
	displayDesc.text = item.description
	displayDesc.show()
	nextBtn.show()
		
func show_question():
	displayDesc.hide()
	displayQuestion.show()
	item = dict[item_index]
	displayQuestion.text = item.question
	
func read_file(file):
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	return json_as_dict

func _on_show_result_pressed():
	show_description()
	stop()

func _on_percentage_scale_drag_ended(value_changed):
	showResultBtn.show()

func _on_next_btn_pressed():
	item_index += 1
	refresh_screen()
