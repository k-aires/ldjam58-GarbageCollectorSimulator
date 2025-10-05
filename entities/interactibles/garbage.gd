class_name Garbage
extends RigidBody3D


@export_group("Garbage Properties")
@export_range(0,10,1.0,"or_greater") var max_capacity: int = 1
@onready var label: Label3D = $Label3D

func _ready() -> void:
	set_label(false)

func set_label(visible: bool) -> void:
	label.visible = visible

func get_storage() -> Storage:
	return $Storage
