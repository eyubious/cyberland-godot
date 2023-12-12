extends "res://addons/gut/test.gd"

var gameScene = preload("res://Missions/mission_1/mission_1_game/play_game.gd")

func test_assert_eq_number_not_equal():
	assert_eq(1, 2, "Should fail.  1 != 2")

func test_assert_eq_number_equal():
	assert_eq('asdf', 'asdf', "Should pass")

func test_assert_true_with_true():
	assert_true(true, "Should pass, true is true")

func test_assert_true_with_false():
	assert_true(false, "Should fail")
	
	
func test_run():
	# Instantiate the scene
	var button_scene = load("res://start_seq/start_page.tscn").instantiate()

	# Add the instance to the scene
	add_child(button_scene)

	# Connect the signal from the button
	button_scene.connect("_on_start_btn_pressed", self, "_on_button_test_pressed".to_int())

	# Simulate button press
	button_scene.get_node("Button").emit_signal("_on_start_btn_pressed")


func _on_button_test_pressed():
	# Assert the expected behavior after the button press
	assert(true, "Button press test passed!")







