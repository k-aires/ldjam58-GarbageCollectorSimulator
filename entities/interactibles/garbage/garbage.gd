class_name Garbage
extends RigidBody3D


@onready var label: Label3D = $Label3D
@onready var storage: Storage = $Storage


func _ready() -> void:
	set_label(false)
	var random_storage = randi_range(1, storage.check_empty_space())
	storage.add_to_storage(random_storage)


func set_label(visible: bool) -> void:
	label.visible = visible and not storage.is_empty()


func get_storage() -> Storage:
	return storage
