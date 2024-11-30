extends TouchScreenButton
var count_excess = 0
@export var level_number: int
var presseds = false

func _on_pressed() -> void:
	$"../../../Label1".text = "Верно! Молодец!"
	$"../../../../Звук правильного ответа".play()
	$"../../../Timer".start(1.0)
	$"../../../../..".incorrect_choose = 0
	presseds = true
	hide()
	
func _on_TextTimer_timeout():
	var label= $"../../../Label1"
	if level_number == 2:
		label.update_text("Найди предметы одежды для похода")
	elif level_number == 3:
		label.update_text("Найди домашних животных")
	else:
		label.update_text("Выбери все, что не пригодится в походе")
	$"../../../../Звук правильного ответа".stop()
