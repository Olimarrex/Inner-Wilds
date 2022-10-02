extends Sprite

const dist = 120;
var interaction = false
var combinationCount
var combination = []
var playerComb = []
var codeContainer

func _input(event):
	for key in directions:
		var direction = directions[key];
		if event.is_action_pressed(direction["action"]):
			if interaction == false:
				tryMoveTo(direction["dir"], direction["rayCast"])
			elif interaction == true:
				var newRect = TextureRect.new()
				newRect.texture = load(direction["arrow"])
				codeContainer.add_child(newRect)
				playerComb.append(direction["displayText"])
				checkCombination()

onready var directions = {
	"up": {
		"action": "ui_up",
		"displayText": "Up",
		"arrow": "res://Art/UI/InteractionUI/upArrow.png",
		"rayCast": $RayCast2D_up,
		"dir": Vector2(0, dist)
	},
	"left": {
		"action": "ui_left",
		"displayText": "Left",
		"arrow": "res://Art/UI/InteractionUI/leftArrow.png",
		"rayCast": $RayCast2D_left,
		"dir": Vector2(dist, 0)
	},
	"right": {
		"action": "ui_right",
		"displayText": "Right",
		"arrow": "res://Art/UI/InteractionUI/rightArrow.png",
		"rayCast": $RayCast2D_right,
		"dir": Vector2(-dist, 0)
	},
	"doiwn": {
		"action": "ui_down",
		"displayText": "Down",
		"arrow": "res://Art/UI/InteractionUI/downArrow.png",
		"rayCast": $RayCast2D_down,
		"dir": Vector2(0, -dist)
	}
};

func checkCombination():
	if codeContainer.get_child_count() == combinationCount:
		if playerComb == combination:
			#insert correct noise.
			self.get_parent().get_node("doorInteraction").queue_free()
			interaction = false
		else:
			#insert sound buzzer wrong.
			self.get_parent().get_node("doorInteraction/AnimationPlayer").play("boxfade")
			yield(self.get_parent().get_node("doorInteraction/AnimationPlayer"), "animation_finished")
			for i in codeContainer.get_children():
				i.queue_free()
			playerComb.clear()
			codeContainer.modulate = Color8(255, 255, 255, 255)

onready var objectMap = self.get_parent().get_node("map/ObjectMap")
onready var baseMap = self.get_parent().get_node("map/TileMap")

func tryMoveTo(pos, rayCast2D):
	checkTile(self.global_position - pos)
	if not rayCast2D.is_colliding():
		$"../map".translate(pos)

func checkTile(pos):
	var cell = objectMap.world_to_map(objectMap.to_local(pos))
	var cellv = objectMap.get_cellv(cell);
	if cellv == 5:
		print('NOTE')
	elif cellv == 6:
		Autoload.victory = "Teleporter"
		var _scene = self.get_tree().change_scene("res://Scenes/Victory.tscn")
	elif cellv == 7:
		var _scene = self.get_tree().change_scene("res://Scenes/Death.tscn")
	elif cellv == 8:
		for i in Autoload.doors:
			if objectMap.to_local(pos) == objectMap.to_local(i.global_position):
				print(Autoload.doorInteractionsDic)
				print(i.name)
				combination = Autoload.doorInteractionsDic[i.name]
				combinationCount = Autoload.doorInteractionsDic[i.name].size()
				print(combinationCount)
				print(combination)
		interaction = true
		var interactionNode = preload("res://Scenes/Instances/doorInteraction.tscn").instance()
		self.get_parent().add_child(interactionNode)
		codeContainer = self.get_parent().get_node("doorInteraction/CenterContainer/TextureRect/CenterContainer/HBoxContainer")
