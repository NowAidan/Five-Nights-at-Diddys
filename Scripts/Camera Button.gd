extends Button

signal cam_button_pressed(cam_node_name:String)

## The name of the related Camera3D node
@export var camera_node_name : String


func _ready():
	if camera_node_name.is_empty():
		camera_node_name = text
	

func _pressed():
	print(camera_node_name)
	emit_signal("cam_button_pressed", camera_node_name)
