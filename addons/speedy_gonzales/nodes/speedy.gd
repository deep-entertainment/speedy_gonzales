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
var hidden: bool


# Activate mouse cursor handling by Speedy and load default cursors
func _init():
	if not Engine.editor_hint:
		Input.set_mouse_mode(
			Input.MOUSE_MODE_HIDDEN
		)
	set_custom_mouse_cursor(
		preload("res://addons/speedy_gonzales/images/arrow.png")
	)


# Switch the cursor texture when needed
func _process(delta):
	if hidden and $Cursor.texture != null:
		$Cursor.texture = null
	elif current_shape != Input.get_current_cursor_shape():
		var shape = Input.get_current_cursor_shape()
		current_shape = shape
		current_hotspot = hotspots[shape]
		$Cursor.texture = textures[shape]


# Handle mouse motions
func _input(event):
	if event is InputEventMouseMotion:
		$Cursor.position = event.position - current_hotspot
		

# Set the custom mouse cursor
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

