extends Node2D

# timer variables
var time: float = 10.0
var mins: int = 0
var secs: int = 0
var msec: int = 0

# slider variable
@onready var slider = $VBoxContainer/percentage_scale

# question variables
@onready var displayQuestion = $VBoxContainer/question
@onready var displayDesc = $VBoxContainer/description
@onready var displayAnsw = $VBoxContainer/actualPercentage
@onready var showResultBtn = $VBoxContainer/HBoxContainer/showResult
@onready var nextBtn = $VBoxContainer/HBoxContainer/nextBtn

var dict = read_file("res://Missions/mission_1/mission1_activity/questions_answers.json")
var item: Dictionary
var item_index: int = 0

func _ready():
	refresh_screen()

func refresh_screen():
	slider.value = 0
	$VBoxContainer/percentage_scale/percent.text = "%0d" % slider.value + "%"
	time = 10.0
	set_process(true)
	showResultBtn.disabled = true
	nextBtn.disabled = true
	if item_index >= dict.size():
		get_tree().change_scene_to_file("res://Missions/mission_1/mission1_activity/task3_end.tscn")
	else:
		show_question()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time -= delta
	msec = fmod(time, 1) * 100
	secs = fmod(time, 60)
	mins = fmod(time, 3600) / 60
	$VBoxContainer/timer/mins.text = "%02d:" % mins
	$VBoxContainer/timer/secs.text = "%02d." % secs
	$VBoxContainer/timer/msec.text = "%02d" % msec

	if (mins == 0 && secs == 0 && msec == 0):
		stop()
		show_description()
		show_answer()

func stop() -> void:
	set_process(false)

func format_time() -> String:
	return "%02d:%02d.%02d" % [mins, secs, msec]
		
func show_description():
	item = dict[item_index]
	displayDesc.text = item.description
	displayDesc.show()
	nextBtn.disabled = false
		
func show_question():
	displayDesc.text = ""
	displayAnsw.text = ""
	displayQuestion.show()
	item = dict[item_index]
	displayQuestion.text = item.question

func show_answer():
	item = dict[item_index]
	displayAnsw.text = item.answer
	displayAnsw.show()
	
func read_file(file):
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	return json_as_dict

func _on_show_result_pressed():
	show_description()
	show_answer()
	stop()

func _on_percentage_scale_drag_ended(value_changed):
	$VBoxContainer/percentage_scale/percent.text = "%02d" % slider.value + "%"
	showResultBtn.disabled = false

func _on_next_btn_pressed():
	item_index += 1
	refresh_screen()
