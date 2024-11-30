extends Node2D
var level = " "

func _ready() -> void:
	self.visible = false

func _on_start_pressed() -> void:
	if level == "4":
		var mainScene = load("res://меню_животные.tscn")
		get_tree().change_scene_to_packed(mainScene)
	else:
		var mainScene = load("res://меню.tscn")
		get_tree().change_scene_to_packed(mainScene)

func _on_visibility_changed() -> void:
	if self.visible:
		$"Control/Уровень пройден".play()
	else:
		$"Control/Уровень пройден".stop()

func _on_следующий_уровень_pressed() -> void:
	if level != " ":
		var mainScene = load("res://level_" + level + ".tscn")
		get_tree().change_scene_to_packed(mainScene)
