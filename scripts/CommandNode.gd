extends Node

signal response_gen(response_text)

var current_area = null;

func init(starting_area):
	changeRoom(starting_area)


func Process_Command(input: String):
	var words = input.split(" ", false, 0)
	if words.size() == 0:
		return "Error: No words to process"
	var firstWord = words[0].to_lower()

	var secondWord = " "

	if words.size() > 1:
		secondWord = words[1].to_lower()

	match firstWord:
		"go": 
			return go(secondWord)

		"help":
			return help()

		"search": return search()	

		_: return "Unrecognized Command"




func go(secondWord: String):
	if secondWord == " ":
		return "go where?"

	return "you go %s" % secondWord	

func help():
	return "help menu\nyou can use 'Go' to move\nyou can use 'Back' to go back\nyou can use'search' to look around the room, or investigate the area"


func search():
	return "you look around the room and find the door isn't latched all of the way"


func changeRoom(new_room: Room):
	current_area = new_room
	emit_signal("response_gen", "You go to " + new_room.room_description)
	emit_signal("response_gen", new_room.room_description)