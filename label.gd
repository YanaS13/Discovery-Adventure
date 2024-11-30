extends Label
var text_state = " "
@export var level_number: int
func _ready() -> void:
	if level_number == 2:
		set_text("Найди предметы одежды для похода")
	elif level_number == 3:
		set_text("Найди домашних животных")
	else:
		set_text("Выбери все, что не пригодится в походе")

func update_text(new_text: String):
	set_text(new_text) 

func _on_button_pressed() -> void:
	if level_number == 2:
		text_state = "Найди предметы одежды для похода"
	if level_number == 3:
		text_state = "Найди домашних животных"
	if text_state == "Выбери все, что не пригодится в походе" or text_state == "Найди предметы одежды для похода" or text_state == "Найди домашних животных":
		text_state = "Молодец!"
