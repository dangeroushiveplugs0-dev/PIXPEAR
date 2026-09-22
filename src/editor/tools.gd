extends Node

# PIXPEAR drawing tools

enum Tool {
	BRUSH,
	ERASER
}

var current_tool: Tool = Tool.BRUSH
var current_color := Color.WHITE

func set_tool(tool: Tool):
	current_tool = tool

func get_draw_color() -> Color:
	if current_tool == Tool.ERASER:
		return Color.TRANSPARENT
	return current_color
