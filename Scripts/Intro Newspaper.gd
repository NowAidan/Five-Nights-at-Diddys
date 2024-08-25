extends Node2D

@onready var transition = $Transition

const DISPLAY_TIME = 4
const FADE_TIME = 2

func _ready(): # Fades into the newspaper once the scene successfully changes
	transition.play("fade_in")

func _on_transition_animation_finished(_anim_name):
	await get_tree().create_timer(DISPLAY_TIME).timeout
	transition.play("fade_out")
	await get_tree().create_timer(FADE_TIME).timeout
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
