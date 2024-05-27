extends Control


const InputRespose = preload("res://scenes/input_response.tscn")

@onready var history_rows = $background/margin/Rows/gameInfo/historyMargin/historyScroll/HistoryRow


func _input_text_submitted(new_text: String) -> void:
	print(new_text) # for debugging

	var inputResponse = InputRespose.instantiate()
	history_rows.add_child(inputResponse)
