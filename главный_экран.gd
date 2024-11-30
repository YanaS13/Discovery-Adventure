extends Node2D

func _on_start_pressed() -> void:
	var mainScene = load("res://меню_уровней.tscn")
	get_tree().change_scene_to_packed(mainScene)
