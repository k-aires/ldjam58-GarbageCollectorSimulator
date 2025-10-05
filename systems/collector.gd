extends Node


var total_garbage_collected: int = 0 :
	set = set_total_garbage_collected
var money_amount: float = 0.0 :
	set = set_money_amount
var garbage_value: float = 0.0 :
	set = set_garbage_value
# TODO: add skills


func spend_money(amount: float) -> bool:
	if amount <= money_amount:
		money_amount -= amount
		return true
	return false


func set_total_garbage_collected(value: int) -> void:
	if value < 0:
		return
	total_garbage_collected = value


func set_money_amount(value: float) -> void:
	if value < 0.0:
		return
	money_amount = value


func set_garbage_value(value: float) -> void:
	if value < 0.0:
		return
	garbage_value = value
