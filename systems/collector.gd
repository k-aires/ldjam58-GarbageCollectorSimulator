extends Node


var total_garbage_collected: int = 0 :
	set = set_total_garbage_collected
var money_amount: float = 0.0 :
	set = set_money_amount
var garbage_value: float = 0.0 :
	set = set_garbage_value
# TODO: add skills
var inventory: int = 0 : 
	set = set_inventory
var cart_inventory: int = 0 : 
	set = set_cart_inventory


func reset_game() -> void:
	inventory = 0
	cart_inventory = 0
	total_garbage_collected = 0
	money_amount = 0
	garbage_value = 0

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


func set_inventory(value: int = 1) -> void:
	inventory = value

func set_cart_inventory(value: int) -> void:
	cart_inventory = value

func pick_garbage(type: StringName, value: int) -> void:
	set_total_garbage_collected(total_garbage_collected + 1)
	if type == 'cart':
		set_cart_inventory(value)
	elif type == 'inventory':
		set_inventory(value)
	
