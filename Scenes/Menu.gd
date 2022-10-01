extends Control

func _on_playButton_pressed():
	var _scene = self.get_tree().change_scene("res://main.tscn")

func _on_playButton_mouse_entered():
	if $CenterContainer/VBoxContainer/HBoxContainer/playButton.disabled == false:
		$menuSelect.play()
		$CenterContainer/VBoxContainer/HBoxContainer/playButton/play.add_color_override("font_color", Color8(0, 0, 0))

func _on_playButton_mouse_exited():
	if $CenterContainer/VBoxContainer/HBoxContainer/playButton.disabled == false:
		$CenterContainer/VBoxContainer/HBoxContainer/playButton/play.add_color_override("font_color", Color8(255, 255, 255))

func _on_instructionsButton_mouse_entered():
	if $CenterContainer/VBoxContainer/HBoxContainer2/instructionsButton.disabled == false:
		$menuSelect.play()
		$CenterContainer/VBoxContainer/HBoxContainer2/instructionsButton/Label.add_color_override("font_color", Color8(0, 0, 0))

func _on_instructionsButton_mouse_exited():
	if $CenterContainer/VBoxContainer/HBoxContainer2/instructionsButton.disabled == false:
		$CenterContainer/VBoxContainer/HBoxContainer2/instructionsButton/Label.add_color_override("font_color", Color8(255, 255, 255))

func _on_playButton_button_down():
	$CenterContainer/VBoxContainer/HBoxContainer/playButton/play.add_color_override("font_color" ,Color8(128, 128, 128))

func _on_playButton_button_up():
	$CenterContainer/VBoxContainer/HBoxContainer/playButton/play.add_color_override("font_color", Color8(0, 0, 0))

func _on_instructionsButton_button_down():
	$CenterContainer/VBoxContainer/HBoxContainer2/instructionsButton/Label.add_color_override("font_color", Color8(128, 128, 128))

func _on_instructionsButton_button_up():
	$CenterContainer/VBoxContainer/HBoxContainer2/instructionsButton/Label.add_color_override("font_color", Color8(0, 0, 0))
