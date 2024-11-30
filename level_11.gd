extends Node2D
var level = "1"
var condition_met = false
var count_incorrect = Global.count_incorrect
var count_parts = 0
var incorrect_choose = Global.count_incor
var incorrects = false

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if get_node("полка/Control/TextureRect/rect12/арбуз_button").presseds and get_node("полка/Control/TextureRect/rect16/лошадка_button").presseds:
		get_node("подсказкафон").visible = false
		get_node("полка2").visible = true
		get_node("полка").visible = false
		condition_met = true
		count_parts = 1
		count_incorrect = 0

	if get_node("полка2/Control/TextureRect/rect13/юла_button").presseds and get_node("полка2/Control/TextureRect/rect16/мишка_button").presseds:
		get_node("полка2").visible = false
		get_node("подсказкафон").visible = false
		get_node("промежуточное окно").visible = true
		get_node("промежуточное окно").level = "2"
		count_parts = 2
		Global.level_win = true
		condition_met = true
		count_incorrect = 0
		
	get_node("подсказкафон").visible = false
	if (incorrect_choose % 2) == 0 and incorrect_choose != 0:
		incorrects = true
		get_node("подсказкафон").visible = true
		$Timer.start(1.0)
		if count_parts == 0:
			if get_node("полка/Control/TextureRect/rect12/арбуз_button").presseds:
				$"подсказкафон/Подсказка".update_text("     Подсказка: игрушки в походе не нужны")
			else:
				$"подсказкафон/Подсказка".update_text(" Подсказка: снаружи зеленый, внутри красный")
		if count_parts == 1:
			if get_node("полка2/Control/TextureRect/rect13/юла_button").presseds:
				$"подсказкафон/Подсказка".update_text(" Подсказка: игрушки в походе не нужны")
			else:
				$"подсказкафон/Подсказка".update_text(" Подсказка: игрушки в походе не нужны")

func _on_пауза_pressed() -> void:
	get_node("Всплывающее окно").level = "11"
	get_node("Всплывающее окно").level_part = count_parts
	get_node("подсказкафон").visible = false
	get_node("Всплывающее окно").visible = true

func _on_timer_timeout() -> void:
	get_node("подсказкафон").visible = false
	incorrects = false
