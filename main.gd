extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var phase = 0;

func _ready():
	phase = 0;

# Called when the node enters the scene tree for the first time.
func next_phase():
	phase += 1;
	$map.renderPhase(phase);
	if phase == 1:
		#Red Lights
		#Screen Shake
		pass;
	elif phase == 2:
		pass;
		#Alarms & Tentacles first appear. Brig blocked off
	elif phase == 3:
		pass;
	elif phase == 4:
		pass;
	elif phase == 5:
		pass;
#Phase 3 - Tentacles Start Causing Problems
#Phase 4 - More Tentacles or somethings
#Phase 5 - Lights go off
#Phase 6 - Game over
