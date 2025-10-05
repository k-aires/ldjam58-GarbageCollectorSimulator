extends CharacterBody3D


@onready var camera : Camera3D = $SpringArmPivot/Camera3D
@onready var area_hitbox : Area3D = $Area3D
@onready var storage : Storage = $Storage


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	collect()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	direction = direction.rotated(Vector3.UP, camera.global_rotation.y)

	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
func collect() -> void:
	var in_interaction_area: Array[Node3D] = area_hitbox.get_overlapping_bodies()
	var should_process: bool = (
			Input.is_action_just_pressed('interact') and
			in_interaction_area and 
			storage.check_empty_space() != 0
	)
	if not should_process:
		return
	
	var collectable_index: int = in_interaction_area.find_custom(
			func(element: Node3D): return element.is_in_group("Collectable")
	)
	var no_collectables = collectable_index == -1
	if no_collectables:
		return 
		
	var collectable: Node3D = in_interaction_area[collectable_index]
	var collectable_storage: Storage = collectable.get_storage()
	if not collectable_storage:
		return
		
	collectable_storage.set_used_capacity(
			storage.add_to_storage(collectable_storage.used_capacity)
	)	
	
	if collectable_storage.is_empty():
		collectable.queue_free()
	
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if "Garbage" in body.name:
		body.set_label(true)

func _on_area_3d_body_exited(body: Node3D) -> void:
	if "Garbage" in body.name:
		body.set_label(false)
