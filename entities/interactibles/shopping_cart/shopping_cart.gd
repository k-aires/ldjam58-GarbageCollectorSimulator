class_name ShoppingCart
extends RigidBody3D

@onready var label: Label3D = $Label3D
@onready var storage: Storage = $Storage
@onready var remote_transform: RemoteTransform3D = $RemoteTransform3D

func _ready() -> void:
	set_label(false)
	storage.set_max_capacity(10)
	storage.set_used_capacity(0)


func set_label(visible: bool) -> void:
	label.visible = visible


func get_storage() -> Storage:
	return $Storage


var in_range: bool = false :
	set = set_in_range


func set_in_range(new_in_range: bool = false) -> bool:
	in_range = new_in_range
	set_label(in_range)
	return in_range
	

func _on_area_3d_body_entered(body: Node) -> void:
	if not in_range and 'Player' in body.name:
		set_in_range(true)


func _on_area_3d_body_exited(body: Node) -> void:
	if in_range and 'Player' in body.name:
		set_in_range(false)
