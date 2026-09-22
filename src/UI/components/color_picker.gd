extends Control

signal color_selected(color)

var palette = [
	Color.WHITE,
	Color.BLACK,
	Color.RED,
	Color.GREEN,
	Color.BLUE
]

func select_color(index: int):
	if index >= 0 and index < palette.size():
		color_selected.emit(palette[index])
