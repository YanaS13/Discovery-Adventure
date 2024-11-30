extends Node2D
var level = "4"
var condition_met = false
var count = 0
var count_parts = 0
var incorrect_choose = Global.count_incor
var incorrects = false

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if get_node("полка/Control/TextureRect/rect14/собака_button").presseds and get_node("полка/Control/TextureRect/rect16/лошадь_button").presseds:
		get_node("полка2").visible = true
		get_node("полка").visible = false
		get_node("подсказкафон").visible = false
		condition_met = true
		count_parts = 1
	if get_node("полка2/Control/TextureRect/rect15/овца_button").presseds and get_node("полка2/Control/TextureRect/rect11/кот_button").presseds:
		get_node("подсказкафон").visible = false
		get_node("полка3").visible = true
		get_node("полка2").visible = false
		count_parts = 2
		condition_met = true
	if get_node("полка3/Control/TextureRect/rect15/свинья_button").presseds and get_node("полка3/Control/TextureRect/rect14/корова_button").presseds:
		get_node("подсказкафон").visible = false
		get_node("полка3").visible = false
		get_node("промежуточное окно").level = "4"
		get_node("промежуточное окно").visible = true
		condition_met = true
		count_parts = 3
	if (incorrect_choose % 2) == 0 and incorrect_choose != 0:
		incorrects = true
		get_node("подсказкафон").visible = true
		$Timer.start(1.0)
		if count_parts == 2:
			if get_node("полка3/Control/TextureRect/rect15/свинья_button").presseds:
				$"подсказкафон/Подсказка".update_text(" Подсказка: говорит 'му-му'")
			else:
				$"подсказкафон/Подсказка".update_text(" Подсказка: говорит 'хрю-хрю'")
		if count_parts == 0:
			if get_node("полка/Control/TextureRect/rect14/собака_button").presseds:
				$"подсказкафон/Подсказка".update_text(" Подсказка: говорит 'иго-го'")
			else:
				$"подсказкафон/Подсказка".update_text(" Подсказка: говорит 'гав'")
		if count_parts == 1:
			if get_node("полка2/Control/TextureRect/rect15/овца_button").presseds:
				$"подсказкафон/Подсказка".update_text(" Подсказка: говорит 'мяу'")
			else:
				$"подсказкафон/Подсказка".update_text(" Подсказка: говорит 'бе-е-е'")

func _on_пауза_pressed() -> void:
	get_node("Всплывающее окно").level = "3"
	get_node("подсказкафон").visible = false
	get_node("Всплывающее окно").level_part = count_parts
	get_node("Всплывающее окно").visible = true

func _on_timer_timeout() -> void:
	get_node("подсказкафон").visible = false
	incorrects = false
