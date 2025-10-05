extends Control


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/base_test.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
