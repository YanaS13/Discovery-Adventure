extends TouchScreenButton
var variable = false

func _ready() -> void:
	var variable = Global.level_win
	if variable:
		self.visible = false
	else:
		self.visible = true
	
func level_win(delta: bool):
	if delta:
		self.visible = false
