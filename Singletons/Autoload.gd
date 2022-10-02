extends Node

var victory = ""
var doorInteractionsDic = {}
var notesDic = {}
var doors = []

func _ready():
	doorInteractionsJSON()
	notesJSON()

func doorInteractionsJSON():
	var doorInteractionsFile = File.new()
	doorInteractionsFile.open("res://Data/doorInteractions.json", File.READ)
	var doorInteractionsJSON = JSON.parse(doorInteractionsFile.get_as_text())
	doorInteractionsFile.close()
	doorInteractionsDic = doorInteractionsJSON.result

func notesJSON():
	var notesFile = File.new()
	notesFile.open("res://Data/notes.json", File.READ)
	var notesJSON = JSON.parse(notesFile.get_as_text())
	notesFile.close()
	notesDic = notesJSON.result
