<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# speedy.gd

**Extends:** [CanvasLayer](../CanvasLayer)

## Description

Speedy mouse cursor handling

## Property Descriptions

### hotspots

```gdscript
var hotspots: Dictionary
```

A dictionary of mouse cursor hotspots for cursor shapes

### textures

```gdscript
var textures: Dictionary
```

A dictionary of mouse cursor textures for cursor shapes

### current\_hotspot

```gdscript
var current_hotspot: Vector2
```

The current mouse cursors hotspot

### current\_shape

```gdscript
var current_shape
```

The current shape

### hidden

```gdscript
var hidden: bool
```

Wether the mouse cursor is hidden currently

### keep\_shape

```gdscript
var keep_shape: bool = false
```

Keep the current cursor shape and don't update it

### is\_touch

```gdscript
var is_touch: bool = false
```

Helper variable if we're on a touch device

## Method Descriptions

### set\_custom\_mouse\_cursor

```gdscript
func set_custom_mouse_cursor(image: Texture, shape, hotspot: Vector2 = "(0, 0)", target_position = null)
```

### set\_shape

```gdscript
func set_shape(shape: int)
```

Force the current mouse cursor to display the given shape

** Parameters **

- shape (Input.CursorShape) the shape id to set