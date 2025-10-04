class_name Storage
extends Node


@export_category("Storage Properties")
@export_range(1, 10, 1.0, "or_greater") var max_capacity: int = 1

var capacity: int = 0 :
	set = set_capacity


# Returns overflow
func add_to_storage(amount: int) -> int:
	return 0


func remove_from_storage(amount: int) -> int:
	return 0


func remove_all() -> int:
	return capacity


func set_capacity(value: int) -> void:
	if value > max_capacity:
		capacity = max_capacity
	elif value < 0:
		capacity = 0
	else:
		capacity = value
