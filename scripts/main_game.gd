extends Control


const InputRespose = preload("res://scenes/input_response.tscn")

@export var max_lines_held : int = 30

var max_scroll_val = 0;



@onready var history_rows = $background/margin/Rows/gameInfo/historyScroll/HistoryRow
@onready var scroll = $background/margin/Rows/gameInfo/historyScroll
@onready var scrollbar = scroll.get_v_scroll_bar()

func _ready() -> void:
	scrollbar.changed.connect(scroll_changed)
	max_scroll_val = scrollbar.max_value

func scroll_changed():
	if max_scroll_val != scrollbar.max_value:
		max_scroll_val = scrollbar.max_value
		scroll.scroll_vertical = max_scroll_val


func _input_text_submitted(new_text: String) -> void:

	if new_text.is_empty():
		return # prevent empty input

	var inputResponse = InputRespose.instantiate()	
	inputResponse.Set_Text(new_text, ReturnToSender(new_text)) #
	history_rows.add_child(inputResponse)


func ReturnToSender (new_text: String) -> String:
	var returnMsg = ""
	
	if new_text == "hi mom":
		returnMsg = "Hello Son"
		
	elif new_text == "Hi Son":
			returnMsg = "Hi Mom!"	

	else:
		returnMsg = "I don't know what you said"

	return returnMsg
