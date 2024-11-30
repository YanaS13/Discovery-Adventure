extends TouchScreenButton

func _ready() -> void:
	pass 

func _on_pressed() -> void:
	var mainScene = load("res://меню_уровней.tscn")
	get_tree().change_scene_to_packed(mainScene)
