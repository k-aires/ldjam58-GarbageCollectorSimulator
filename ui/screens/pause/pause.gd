extends Control


@onready var resume: Button = $VBoxContainer/Resume


func _ready() -> void:
	visible = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()
		resume.grab_focus()


func toggle_pause():
	visible = !visible
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = !get_tree().paused


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_resume_pressed() -> void:
	toggle_pause()


func on_main_menu_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = !get_tree().paused
	get_tree().change_scene_to_file("res://ui/screens/main_menu/main_menu.tscn")
