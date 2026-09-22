extends Control

signal color_changed(color)

var selected_color := Color.WHITE

func set_color(color: Color):
	selected_color = color
	color_changed.emit(color)
