extends Node

signal map_update

onready var start_pos = get_node("start_pos").get_pos()
onready var end_pos = get_node("end_pos").get_pos()
onready var nav = get_node("nav")
onready var map = get_node("nav/map")


func _ready():
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON and event.pressed():
		var tile = map.world_to_map(event.pos)
		if event.button_index == 1:
			map.set_cell(tile.x, tile.y, 1)
		elif event.button_index == 2:
			map.set_cell(tile.x, tile.y, 0)
	if event.type == InputEvent.MOUSE_BUTTON and not event.pressed():
		emit_signal ("map_update")