extends Control

func _ready() -> void:
	visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()
		$VBoxContainer/Resume.grab_focus()


func toggle_pause():
	visible = !visible
	get_tree().paused = !get_tree().paused
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_resume_pressed() -> void:
	toggle_pause()
