extends Sprite

const dist = 120;
var interactor = null;
var codeContainer

func _input(event):
	for key in directions:
		var direction = directions[key];
		if event.is_action_pressed(direction["action"]):
			if interactor == null:
				tryMoveTo(direction["dir"], direction["rayCast"], direction["objrayCast"])
			else:
				var interactionDone = interactor.onInput(direction)
				if (typeof(interactionDone) == TYPE_OBJECT && interactionDone.is_class("GDScriptFunctionState")):
					pass;
				elif(interactionDone):
					interactor = null;

onready var directions = {
	"up": {
		"action": "ui_up",
		"displayText": "Up",
		"arrow": "res://Art/UI/InteractionUI/upArrow.png",
		"rayCast": $RayCast2D_up,
		"objrayCast": $RayCast2D_obj_up,
		"dir": Vector2(0, dist)
	},
	"left": {
		"action": "ui_left",
		"displayText": "Left",
		"arrow": "res://Art/UI/InteractionUI/leftArrow.png",
		"rayCast": $RayCast2D_left,
		"objrayCast": $RayCast2D_obj_left,
		"dir": Vector2(dist, 0)
	},
	"right": {
		"action": "ui_right",
		"displayText": "Right",
		"arrow": "res://Art/UI/InteractionUI/rightArrow.png",
		"rayCast": $RayCast2D_right,
		"objrayCast": $RayCast2D_obj_right,
		"dir": Vector2(-dist, 0)
	},
	"doiwn": {
		"action": "ui_down",
		"displayText": "Down",
		"arrow": "res://Art/UI/InteractionUI/downArrow.png",
		"rayCast": $RayCast2D_down,
		"objrayCast": $RayCast2D_obj_down,
		"dir": Vector2(0, -dist)
	}
};

onready var objectMap = self.get_parent().get_node("map/ObjectMap")
onready var baseMap = self.get_parent().get_node("map/TileMap")

func tryMoveTo(pos, rayCast2D, objrayCast):
	checkTile(self.global_position - pos)
	if not objrayCast.is_colliding():
		#nothing to boop
		if not rayCast2D.is_colliding():
			$"../map".translate(pos)
	elif (objrayCast.get_collider().boop()):
		#we booped it, start interacting and not moving.
		interactor = objrayCast.get_collider();
	else:
		#tried to boop but failed
		if not rayCast2D.is_colliding():
			$"../map".translate(pos)

func checkTile(pos):
	var cell = objectMap.world_to_map(objectMap.to_local(pos))
	var cellv = objectMap.get_cellv(cell);
	if cellv == 5:
		return #note
	elif cellv == 6:
		Autoload.victory = "Teleporter"
		var _scene = self.get_tree().change_scene("res://Scenes/Victory.tscn")
	elif cellv == 7:
		var _scene = self.get_tree().change_scene("res://Scenes/Death.tscn")
	elif cellv == 8:
		return #door
