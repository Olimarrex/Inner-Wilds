extends Node2D


# Declare member variables here. Examples:
# var a = 2
export(Array, String) var combination
var codeContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var container = self.get_parent().get_parent().get_parent().get_parent()

var isOpen = false;

var playerComb = []
func boop():
	if(!isOpen):
		var interactionNode = preload("res://Scenes/Instances/doorInteraction.tscn").instance()
		container.add_child(interactionNode)
		codeContainer = container.get_node("doorInteraction/CenterContainer/TextureRect/CenterContainer/HBoxContainer")
		return true;
	else:
		return false;

func onInput(direction): 
	var newRect = TextureRect.new()
	if (codeContainer.get_child_count() < combination.size()):
		newRect.texture = load(direction["arrow"])
		codeContainer.add_child(newRect)
		playerComb.append(direction["displayText"])
		return checkCombination()
	return false;
	
func checkCombination():
	var shouldStop = false;
	print(playerComb, combination)
	if codeContainer.get_child_count() == combination.size():
		if playerComb == combination:
			#insert correct noise.
			container.get_node("doorInteraction").queue_free();
			shouldStop = true;
			isOpen = true;
		else:
			#insert sound buzzer wrong.
			container.get_node("doorInteraction/AnimationPlayer").play("boxfade")
			yield(container.get_node("doorInteraction/AnimationPlayer"), "animation_finished")
			for i in codeContainer.get_children():
				i.queue_free()
			codeContainer.modulate = Color8(255, 255, 255, 255)
		playerComb.clear()
		return shouldStop
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
