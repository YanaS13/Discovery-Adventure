extends Label
@export var level: int

func _ready() -> void:
	set_text("Подсказка") 

func update_text(new_text: String):
	set_text(new_text) 
