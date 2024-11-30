extends TouchScreenButton
@export var level_number: int
@export var level_part: int
var incorrect = false
var count = Global.count_incorrect

func _ready() -> void:
	pass 
func _on_pressed() -> void:
	var label= $"../../../Label1"
	label.update_text("Попробуй еще раз!")
	$"../../../../Не правильно".play()
	$"../../../Timer".start(1.0)
	$"../../../../..".incorrect_choose += 1
	count = count + 1
	
func _on_TextTimer_timeout():
	var label= $"../../../Label1"
	if level_number == 2:
		label.update_text("Выбери все, что не пригодится в походе")
	elif level_number == 3:
		label.update_text("Найди домашних животных")
	$"../../../../Не правильно".stop()
