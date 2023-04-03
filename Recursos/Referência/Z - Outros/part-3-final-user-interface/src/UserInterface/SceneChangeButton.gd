@tool
extends Button


@export var next_scene_path: = "" # (String, FILE)


func _on_button_up() -> void:
	PlayerData.reset()
	get_tree().change_scene_to_file(next_scene_path)


func _get_configuration_warnings() -> String:
	return "The property Next Level can't be empty" if next_scene_path == "" else ""
