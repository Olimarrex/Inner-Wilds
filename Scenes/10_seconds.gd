extends Node2D

func you_dead():
	var i = get_tree().change_scene("res://Scenes/you_dead.tscn")
	if i == 0: print('you dead good :)')
