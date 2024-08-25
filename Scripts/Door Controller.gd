extends Node3D

@onready var doorAnimations = $"../../AnimationPlayer"
@onready var soundLD = $"../../Left Door Sound"
@onready var soundRD = $"../../Right Door Sound"

func _on_rightDoorButton_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if GameInfo.rightDoorOpen == true and not doorAnimations.is_playing():
				GameInfo.rightDoorOpen = false
				GameInfo.powerDrainMultiplier += 1
				doorAnimations.play("rd_close")
				soundRD.play()
			elif GameInfo.rightDoorOpen == false and not doorAnimations.is_playing():
				GameInfo.rightDoorOpen = true
				GameInfo.powerDrainMultiplier -= 1
				doorAnimations.play("rd_open")
				soundRD.play()

func _on_leftDoorButton_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if GameInfo.leftDoorOpen == true and not doorAnimations.is_playing():
				GameInfo.leftDoorOpen = false
				GameInfo.powerDrainMultiplier += 1
				doorAnimations.play("ld_close")
				soundLD.play()
			elif GameInfo.leftDoorOpen == false and not doorAnimations.is_playing():
				GameInfo.leftDoorOpen = true
				GameInfo.powerDrainMultiplier -= 1
				doorAnimations.play("ld_open")
				soundLD.play()
