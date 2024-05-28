extends VBoxContainer


func Set_Text(input: String, response: String):
	$userHistory.text = " > " + input 
	$userResponse.text = response
