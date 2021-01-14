# Speedy Gonzales - The fastest software mouse cursor in Mexico.
# (Actually, a software mouse cursor framework)
tool
extends EditorPlugin


# Load the Speedy singleton
func _enter_tree():
	add_autoload_singleton(
		"Speedy",
		"res://addons/speedy_gonzales/nodes/speedy.tscn"
	)


# Remove the Speedy singleton
func _exit_tree():
	remove_autoload_singleton("Speedy")
