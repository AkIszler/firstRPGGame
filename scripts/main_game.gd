extends Control


const InputRespose = preload("res://scenes/input_response.tscn")

@onready var history_rows = $background/margin/Rows/gameInfo/historyMargin/historyScroll/HistoryRow


func _input_text_submitted(new_text: String) -> void:
	print(new_text) # for debugging
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