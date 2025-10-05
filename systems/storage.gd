class_name Storage
extends Node


@export_category("Storage Properties")
@export_range(1, 10, 1.0, "or_greater") var max_capacity: int = 1 :
	set = set_max_capacity

@export_range(1, 10, 1.0, "or_greater") var used_capacity: int = 0 :
	set = set_used_capacity


# Returns overflow
func add_to_storage(amount: int) -> int:
	var overflow: int = amount - (max_capacity - used_capacity)
	if overflow > 0:
		amount -= overflow
	else:
		overflow = 0
	used_capacity += amount
	return overflow


func remove_from_storage(amount: int) -> int:
	if amount > used_capacity:
		amount = used_capacity
	used_capacity -= amount
	return amount


func remove_all() -> int:
	return used_capacity


func check_empty_space() -> int:
	return max_capacity - used_capacity


func check_capacity_percentage() -> float:
	return used_capacity / max_capacity
	
	
func is_empty() -> bool:
	return used_capacity == 0


func set_max_capacity(value: int) -> void:
	if value <= 0:
		value = 1
	max_capacity = value


func set_used_capacity(value: int) -> void:
	if value > max_capacity:
		used_capacity = max_capacity
	elif value < 0:
		used_capacity = 0
	else:
		used_capacity = value
