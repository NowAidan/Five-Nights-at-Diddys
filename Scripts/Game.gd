extends Node3D

@onready var powerGui = $GUI/GUI/Power
@onready var timeGui = $GUI/GUI/Time

const SECONDS_PER_HOUR: int = 60

@export var powerDrainTime: int = 6

# Begins power and time systems
func _ready():
	_start_counting.call_deferred()
	
	while GameInfo.inGame == true and GameInfo.power > 0:
		@warning_ignore("integer_division")
		await get_tree().create_timer(powerDrainTime / GameInfo.powerDrainMultiplier).timeout
		updatePower()

# Counting and updating the time system
func _start_counting():
	while GameInfo.time < 6:
		timeGui.text = _get_current_hour_text()
		await get_tree().create_timer(SECONDS_PER_HOUR).timeout
		GameInfo.time += 1
	
	timeGui.text = _get_current_hour_text()
	
# Converting the time to a string value
func _get_current_hour_text() -> String:
	if GameInfo.time == 0:
		return "12:00AM"
	else:
		return str(GameInfo.time) + ":00AM"

# Updating and managing the power system
func updatePower():
	GameInfo.power -= 1
	powerGui.text = "Power: " + str(GameInfo.power) + "%"
