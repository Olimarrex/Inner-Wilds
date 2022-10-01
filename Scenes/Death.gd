extends Control

func _ready():
	$CenterContainer/VBoxContainer/VBoxContainer/TextureButton.disabled = true
	$AnimationPlayer.play("tentacleDeath")
	yield($AnimationPlayer, "animation_finished")
	$CenterContainer/VBoxContainer/VBoxContainer/TextureButton.disabled = false

func _on_TextureButton_pressed():
	var _scene = self.get_tree().change_scene("res://main.tscn")

func _on_TextureButton_mouse_entered():
	if $CenterContainer/VBoxContainer/VBoxContainer/TextureButton.disabled == false:
		$menuSelect.play()
		$CenterContainer/VBoxContainer/VBoxContainer/TextureButton/Label.add_color_override("font_color", Color8(0, 0, 0))

func _on_TextureButton_mouse_exited():
	if $CenterContainer/VBoxContainer/VBoxContainer/TextureButton.disabled == false:
		$CenterContainer/VBoxContainer/VBoxContainer/TextureButton/Label.add_color_override("font_color", Color8(255, 255, 255))

func _on_TextureButton_button_down():
	$CenterContainer/VBoxContainer/VBoxContainer/TextureButton/Label.add_color_override("font_color", Color8(128, 128, 128))

func _on_TextureButton_button_up():
	$CenterContainer/VBoxContainer/VBoxContainer/TextureButton/Label.add_color_override("font_color", Color8(0, 0, 0))
