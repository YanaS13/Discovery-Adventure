extends Node2D
var level = " "
var level_part = 0
func _ready() -> void:
	self.visible = false

func _process(delta: float) -> void:
	if self.visible and (level == "2" or level == "3" or level == "11") and (level_part == 0 or level_part == 1):
		get_node("../полка").visible = false
		get_node("../подсказкафон").visible = false
	if self.visible and (level == "2" or level == "3" or level == "11") and (level_part == 1 or level_part == 2):
		get_node("../полка2").visible = false
		get_node("../подсказкафон").visible = false
	if self.visible and (level == "2" or level == "3") and (level_part == 2 or level_part == 3):
		get_node("../полка3").visible = false
		get_node("../подсказкафон").visible = false

func _on_начать_заново_pressed() -> void:
	var mainScene = load("res://level_" + level + ".tscn")
	get_tree().change_scene_to_packed(mainScene)
	level_part = 0

func _on_закрыть_pressed() -> void:
	self.visible = false
	if (level == "2" or level == "3" or level == "11") and (level_part == 0 or level_part == 1):
		get_node("../полка").visible = true
	elif (level == "2" or level == "3" or level == "11") and (level_part == 1 or level_part == 2):
		get_node("../полка2").visible = true
	elif (level == "2" or level == "3") and (level_part == 2 or level_part == 3):
		get_node("../полка3").visible = true
		
func _on_меню_pressed() -> void:
	if level == "3":
		var mainScene = load("res://меню_животные.tscn")
		get_tree().change_scene_to_packed(mainScene)
	else:
		var mainScene = load("res://меню.tscn")
		get_tree().change_scene_to_packed(mainScene)
	level_part = 0
