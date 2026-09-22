extends Node2D

var canvas_size := Vector2i(32, 32)
var pixels := {}
var current_color := Color.WHITE

func set_pixel(pos: Vector2i, color: Color):
	if pos.x >= 0 and pos.y >= 0 and pos.x < canvas_size.x and pos.y < canvas_size.y:
		pixels[pos] = color
		queue_redraw()
		GlobalSignals.pixel_changed.emit(pos, color)

func _draw():
	for pos in pixels:
		draw_rect(Rect2(pos, Vector2.ONE), pixels[pos])
