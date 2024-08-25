extends Control

@onready var transition = $Transition

func _on_play_pressed():
	if GameInfo.night == 1 and GameInfo.introPlayed == false: # If it is night 1 and the cutscene hasn't been played before, fade out and show newspaper
		transition.play("fade_out")

func _on_quit_pressed(): # Handles the quit button by closing the game
	get_tree().quit()

func _on_transition_animation_finished(_anim_name): # Swaps scene to newspaper after fade out
	get_tree().change_scene_to_file("res://Scenes/intro_newspaper.tscn")
