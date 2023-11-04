extends Panel

# timer variables
var time: float = 10.0
var mins: int = 0
var secs: int = 0
var msec: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	time -= delta
	msec = fmod(time, 1) * 100
	secs = fmod(time, 60)
	mins = fmod(time, 3600) / 60
	$mins.text = "%02d:" % mins
	$secs.text = "%02d." % secs
	$msec.text = "%03d" % msec
	
func stop() -> void:
	set_process(false)
	
func format_time() -> String:
	return "%02d:%02d.%03d" % [mins, secs, msec]
