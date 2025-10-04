class_name Garbage
extends RigidBody3D


@export_group("Garbage Properties")
@export_range(0,10,1.0,"or_greater") var max_capacity: int = 1

var capacity: int = 1 :
	set = set_capacity


func interact() -> void:
	pass


func collect() -> void:
	pass


func set_capacity(value: int) -> void:
	if value >= 0:
		capacity = value
	else:
		capacity = 0
