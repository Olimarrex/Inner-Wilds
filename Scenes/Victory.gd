extends Control

func _ready():
	$HBoxContainer.hide()
	$HBoxContainer/VBoxContainer/HBoxContainer/menuButton.disabled = true
	if Autoload.victory == "Teleporter":
		$HBoxContainer/VBoxContainer/Label.text = "You have successfully escaped through the teleporter!"
		$HBoxContainer/VBoxContainer/Label3.text = "You tell your government about the horrifying entity you encountered but are quickly swept away to a detention centre. You hear news that the Dimension Gate is blocked and no one will ever be allowed in ever again."
	else:
		pass #Add stuff for alternative endings.
	$HBoxContainer.show()
	$AnimationPlayer.play("fadein")
	yield($AnimationPlayer, "animation_finished")
	$HBoxContainer/VBoxContainer/HBoxContainer/menuButton.disabled = false

func _on_menuButton_pressed():
	var _scene = self.get_tree().change_scene("res://Scenes/Menu.tscn")

func _on_menuButton_mouse_entered():
	if $HBoxContainer/VBoxContainer/HBoxContainer/menuButton.disabled == false:
		$menuSelect.play()
		$HBoxContainer/VBoxContainer/HBoxContainer/menuButton/Label.add_color_override("font_color", Color8(0, 0, 0))

func _on_menuButton_mouse_exited():
	if $HBoxContainer/VBoxContainer/HBoxContainer/menuButton.disabled == false:
		$HBoxContainer/VBoxContainer/HBoxContainer/menuButton/Label.add_color_override("font_color", Color8(255, 255, 255))

func _on_menuButton_button_down():
	$HBoxContainer/VBoxContainer/HBoxContainer/menuButton/Label.add_color_override("font_color", Color8(128, 128, 128))

func _on_menuButton_button_up():
	$HBoxContainer/VBoxContainer/HBoxContainer/menuButton/Label.add_color_override("font_color", Color8(0, 0, 0))
