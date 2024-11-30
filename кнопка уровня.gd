extends TouchScreenButton
@export var nextScreenName: String
@export var numlevel: int

func _ready() -> void:
	pass 

func _on_pressed() -> void:
	if Global.level_win == false and numlevel == 2:
		pass
	else:
		var mainScene = load(nextScreenName)
		get_tree().change_scene_to_packed(mainScene)
