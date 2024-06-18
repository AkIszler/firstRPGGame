extends Control


const InputRespose = preload("res://scenes/input_response.tscn")
const Response = preload("res://scenes/response.tscn")

@export var max_lines_held : int = 30

var max_scroll_val = 0;


@onready var commandProcess = $CommandNode
@onready var history_rows = $background/margin/Rows/gameInfo/historyScroll/HistoryRow
@onready var scroll = $background/margin/Rows/gameInfo/historyScroll
@onready var scrollbar = scroll.get_v_scroll_bar()
@onready var area_management = $RoomManager

func _ready():
	scrollbar.changed.connect(scroll_changed)
	max_scroll_val = scrollbar.max_value

	createResponse("welcome to Jailscape!\ntype 'help' to see available commands")
	var startingRoomResponse = commandProcess.init(area_management.get_child(0))
	createResponse(startingRoomResponse)

func scroll_changed():
	if max_scroll_val != scrollbar.max_value:
		max_scroll_val = scrollbar.max_value
		scroll.scroll_vertical = max_scroll_val


func _input_text_submitted(new_text: String):

	var response = commandProcess.Process_Command(new_text);

	if new_text.is_empty():
		return # prevent empty input

	var inputResponse = InputRespose.instantiate()	
	inputResponse.Set_Text(new_text, response) #
	add_response_to_history(inputResponse)

func add_response_to_history(response: Control):
	history_rows.add_child(response)
	keep_history_clear()



func createResponse(response_text: String):
	var responseMsg = Response.instantiate()
	responseMsg.text = response_text
	add_response_to_history(responseMsg)


func keep_history_clear():	
	if history_rows.get_child_count() > max_lines_held:
		history_rows.remove_child(history_rows.get_children()[0]) 
