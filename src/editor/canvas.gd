extends Node2D

var canvas_size := Vector2i(32, 32)
var pixels := {}
var current_color := Color.WHITE
var pixel_scale := 16
var drawing := false

func _ready():
	queue_redraw()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			drawing = event.pressed
			if drawing:
				paint_at_mouse(event.position)

	if event is InputEventMouseMotion and drawing:
		paint_at_mouse(event.position)

func paint_at_mouse(mouse_position: Vector2):
	var pixel_pos = Vector2i(mouse_position / pixel_scale)
	set_pixel(pixel_pos, current_color)

func set_pixel(pos: Vector2i, color: Color):
	if pos.x >= 0 and pos.y >= 0 and pos.x < canvas_size.x and pos.y < canvas_size.y:
		pixels[pos] = color
		queue_redraw()
		GlobalSignals.pixel_changed.emit(pos, color)

func _draw():
	for x in range(canvas_size.x):
		for y in range(canvas_size.y):
			var pos = Vector2i(x, y)
			draw_rect(Rect2(pos * pixel_scale, Vector2.ONE * pixel_scale), Color(0.12, 0.12, 0.12))

	for pos in pixels:
		draw_rect(Rect2(pos * pixel_scale, Vector2.ONE * pixel_scale), pixels[pos])
