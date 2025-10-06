extends Control

@onready var score_counter: Label = $MarginContainer/Score/ScoreCounter
@onready var timer_label: Label = $MarginContainer/Timer/TimerLabel
@onready var money_counter: Label = $MarginContainer/VBoxContainer/Money/MoneyCounter
@onready var inventory_counter: Label = $MarginContainer/VBoxContainer/Inventory2/InventoryCounter
@onready var cart_inventory_counter: Label = $MarginContainer/VBoxContainer/CartInventory/CartInventoryCounter

@onready var timer: Timer = $Timer

@export_range(0, 59, 1.0) var minutes: int = 0:
	set = increment_minutes
@export_range(0, 59, 1.0) var seconds: int = 0:
	set = increment_seconds


func _ready() -> void:
	timer.start()
	update_hud()


func _process(delta) -> void:
	update_hud()


func update_hud() -> void:
	money_counter.text = "%04d" % Collector.money_amount
	score_counter.text = "%06d" % Collector.total_garbage_collected
	timer_label.text = "%02d" % minutes + ":" + "%02d" % seconds
	inventory_counter.text = "%02d" % Collector.inventory + "/" + "02"
	cart_inventory_counter.text = "%02d" % Collector.cart_inventory + "/" + "10"


func increment_minutes(_value: int = 1) -> void:
	if minutes >= 59:
		minutes = 0
		return
	minutes += 1


func increment_seconds(_value: int = 1) -> void:
	if seconds >= 59:
		seconds = 0
		increment_minutes()
		return
	seconds += 1
