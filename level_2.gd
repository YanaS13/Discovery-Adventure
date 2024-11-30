extends Node2D
var level = "2"
var condition_met = false
var count_incorrect = Global.count_incorrect
var count_parts = 0
var incorrect_choose = Global.count_incor
var incorrects = false

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if get_node("полка/Control/TextureRect/rect14/штаны_button").presseds and get_node("полка/Control/TextureRect/rect16/кепка_button").presseds:
		get_node("подсказкафон").visible = false
		get_node("полка2").visible = true
		get_node("полка").visible = false
		condition_met = true
		count_parts = 1
		count_incorrect = 0

	if get_node("полка2/Control/TextureRect/rect15/носки_button").presseds and get_node("полка2/Control/TextureRect/rect11/футболка_button").presseds:
		get_node("полка3").visible = true
		get_node("полка2").visible = false
		get_node("подсказкафон").visible = false
		count_parts = 2
		condition_met = true
		count_incorrect = 0

	if get_node("полка3/Control/TextureRect/rect15/шорты_button").presseds and get_node("полка3/Control/TextureRect/rect14/куртка_button").presseds:
		get_node("полка3").visible = false
		get_node("подсказкафон").visible = false
		get_node("промежуточное окно").visible = true
		count_incorrect = 0
		condition_met = true
		count_parts = 3
	get_node("подсказкафон").visible = false
	if (incorrect_choose % 2) == 0 and incorrect_choose != 0:
		incorrects = true
		get_node("подсказкафон").visible = true
		$Timer.start(1.0)
		if count_parts == 2:
			if get_node("полка3/Control/TextureRect/rect15/шорты_button").presseds:
				$"подсказкафон/Подсказка".update_text(" Подсказка: защищает от холода и дождя")
			else:
				$"подсказкафон/Подсказка".update_text("       Подсказка: короткие штаны ")
		if count_parts == 0:
			if get_node("полка/Control/TextureRect/rect14/штаны_button").presseds:
				$"подсказкафон/Подсказка".update_text(" Подсказка: защищает голову от солнца летом")
			else:
				$"подсказкафон/Подсказка".update_text(" Подсказка: надеваем на наши ноги")
		if count_parts == 1:
			if get_node("полка2/Control/TextureRect/rect15/носки_button").presseds:
				$"подсказкафон/Подсказка".update_text(" Подсказка: одежда с коротким рукавом")
			else:
				$"подсказкафон/Подсказка".update_text("   Подсказка: теплые штучки для ног")

func _on_пауза_pressed() -> void:
	get_node("Всплывающее окно").level = "2"
	get_node("Всплывающее окно").level_part = count_parts
	get_node("подсказкафон").visible = false
	get_node("Всплывающее окно").visible = true

func _on_timer_timeout() -> void:
	get_node("подсказкафон").visible = false
	incorrects = false
