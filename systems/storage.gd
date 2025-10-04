class_name Storage
extends Node


@export_category("Storage Properties")
@export_range(1, 10, 1.0, "or_greater") var max_capacity: int = 1 :
	set = set_max_capacity

var capacity: int = 0 :
	set = set_capacity


# Returns overflow
func add_to_storage(amount: int) -> int:
	var overflow: int = amount - (max_capacity - capacity)
	if overflow > 0:
		amount -= overflow
	else:
		overflow = 0
	capacity += amount
	return overflow


func remove_from_storage(amount: int) -> int:
	if amount > capacity:
		amount = capacity
	capacity -= amount
	return amount


func remove_all() -> int:
	return capacity


func check_empty_space() -> int:
	return max_capacity - capacity


func check_capacity_percentage() -> float:
	return capacity / max_capacity


func set_max_capacity(value: int) -> void:
	if value <= 0:
		value = 1
	max_capacity = value


func set_capacity(value: int) -> void:
	if value > max_capacity:
		capacity = max_capacity
	elif value < 0:
		capacity = 0
	else:
		capacity = value
