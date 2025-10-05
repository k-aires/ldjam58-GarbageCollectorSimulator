class_name Garbage
extends RigidBody3D


@onready var label: Label3D = $Label3D

func _ready() -> void:
	set_label(false)

func set_label(visible: bool) -> void:
	label.visible = visible and not $Storage.is_empty()

func get_storage() -> Storage:
	return $Storage
