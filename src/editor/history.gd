extends Node

# Simple foundation for undo/redo support
var undo_stack: Array = []
var redo_stack: Array = []

func push_action(action):
	undo_stack.append(action)
	redo_stack.clear()

func undo():
	if undo_stack.is_empty():
		return null
	var action = undo_stack.pop_back()
	redo_stack.append(action)
	return action

func redo():
	if redo_stack.is_empty():
		return null
	var action = redo_stack.pop_back()
	undo_stack.append(action)
	return action
