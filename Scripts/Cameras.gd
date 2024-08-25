extends Control

const IGNORE_MOUSE_ENTERING_BOTTOM_MARGIN = 25.0

@onready var monitor_button = $GUI/MonitorButton
@onready var camera_manager = $GUI/CameraManager
@onready var camera_ui = %CameraUI

func _on_monitor_button_mouse_entered():
	if is_mouse_coming_from_bottom_of_window():
		return
	if camera_ui.visible == false:
		camera_manager.enable_camera_display()
	else:
		camera_manager.disable_camera_display()

func is_mouse_coming_from_bottom_of_window() -> bool:
	return get_global_mouse_position().y > (get_viewport().get_visible_rect().size.y - IGNORE_MOUSE_ENTERING_BOTTOM_MARGIN)
