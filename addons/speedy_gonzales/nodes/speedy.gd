# Speedy mouse cursor handling
extends CanvasLayer


# A dictionary of mouse cursor hotspots for cursor shapes
var hotspots: Dictionary

# A dictionary of mouse cursor textures for cursor shapes
var textures: Dictionary

# The current mouse cursors hotspot
var current_hotspot: Vector2

# The current shape
var current_shape

# Wether the mouse cursor is hidden currently
var hidden: bool setget _set_hidden

# Keep the current cursor shape and don't update it
var keep_shape: bool = false


# Activate mouse cursor handling by Speedy and load default cursors
func _init():
	if not Engine.editor_hint:
		Input.set_mouse_mode(
			Input.MOUSE_MODE_HIDDEN
		)
	set_custom_mouse_cursor(
		preload("res://addons/speedy_gonzales/images/arrow.png")
	)


# Handle mouse motions and switch cursor when needed
#
# ** Parameters **
#
# - event: The input event
func _input(event):
	if event is InputEventMouseMotion:
		if not hidden and not keep_shape \
				and current_shape != Input.get_current_cursor_shape():
			_update_shape()
		$Cursor.position = event.position - current_hotspot
		

# Set the custom mouse cursor
#
# ** Parameters **
#
# - image: The image to use for the mouse cursor
# - shape: The shape id that the image should represent
# - hotspot: The hotspot position of the cursor
# - target_position: Warp the mouse cursor to this point
func set_custom_mouse_cursor(
	image: Texture, 
	shape = Input.CURSOR_ARROW, 
	hotspot: Vector2 = Vector2(0,0),
	target_position = null
):
	textures[shape] = image
	hotspots[shape] = hotspot
	if target_position == null and get_viewport() != null:
		target_position = get_viewport().get_mouse_position() - current_hotspot
	elif target_position != null:
		get_viewport().warp_mouse(target_position + hotspot)
	if shape == current_shape:
		current_hotspot = hotspots[shape]
		$Cursor.texture = textures[shape]
		$Cursor.position = target_position


# Force the current mouse cursor to display the given shape
#
# ** Parameters **
#
# - shape (Input.CursorShape) the shape id to set
func set_shape(shape: int):
	current_shape = shape
	current_hotspot = hotspots[shape]
	$Cursor.texture = textures[shape]


# Disable the mouse cursor
#
# ** Parameters **
#
# - value: Wether the mouse cursor is hidden or not
func _set_hidden(value: bool):
	hidden = value
	if hidden:
		$Cursor.texture = null
	else:
		_update_shape()


# Update the cursor to reflect the current shape
func _update_shape():
	set_shape(Input.get_current_cursor_shape())
	
