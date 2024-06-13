extends Control


const InputRespose = preload("res://scenes/input_response.tscn")
const Response = preload("res://scenes/response.tscn")

@export var max_lines_held : int = 30

var max_scroll_val = 0;


@onready var commandProcess = $CommandNode
@onready var history_rows = $background/margin/Rows/gameInfo/historyScroll/HistoryRow
@onready var scroll = $background/margin/Rows/gameInfo/historyScroll
@onready var scrollbar = scroll.get_v_scroll_bar()

func _ready() -> void:
	scrollbar.changed.connect(scroll_changed)
	max_scroll_val = scrollbar.max_value
	var startingMsg = Response.instantiate()
	startingMsg.text = "you wake up in a dark room with no memory, you have to get out! use the command 'help' to see your commands"
	add_response_to_history(startingMsg)



func scroll_changed():
	if max_scroll_val != scrollbar.max_value:
		max_scroll_val = scrollbar.max_value
		scroll.scroll_vertical = max_scroll_val


func _input_text_submitted(new_text: String) -> void:

	var response = commandProcess.Process_Command(new_text);

	if new_text.is_empty():
		return # prevent empty input

	var inputResponse = InputRespose.instantiate()	
	inputResponse.Set_Text(new_text, response) #
	add_response_to_history(inputResponse)

func add_response_to_history(response: Control):
	history_rows.add_child(response)
	keep_history_clear()



func keep_history_clear():	
	if history_rows.get_child_count() > max_lines_held:
		history_rows.remove_child(history_rows.get_children()[0]) 
