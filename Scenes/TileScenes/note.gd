extends StaticBody2D

onready var container = self.get_parent().get_parent().get_parent().get_parent()
export(String) var labelText

func boop():
	var interactionNode = preload("res://Scenes/Instances/noteInteraction.tscn").instance()
	container.add_child(interactionNode)
	interactionNode.get_node("CenterContainer/TextureRect/CenterContainer/HBoxContainer/Label").text = labelText;
	return true;

func onInput(direction): 
	container.get_node("doorInteraction").queue_free();
	return true;
