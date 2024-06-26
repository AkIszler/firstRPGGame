extends Node

var current_area = null;

func init(starting_area) -> String:
	return changeRoom(starting_area)


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

		"back": return "You go back"

		_: return "Unrecognized Command"




func go(secondWord: String):
	if secondWord == " ":
		return "go where?"

	if current_area.exits.keys().has(secondWord):
		var change_resonse = changeRoom(current_area.exits[secondWord])
		return  "\n".join(PackedStringArray(["you go %s" % secondWord, change_resonse]))
	else:	
		return "You can't go there, there is not an exit going %s" % secondWord		

	

func help():
	return "help menu\nyou can use 'Go' to move\nyou can use 'Back' to go back\nyou can use 'search' to look around the room, or investigate the area"


func search():
	return "you look around"


func changeRoom(new_room: GameRoom) -> String:
	current_area = new_room
	var exit_string = PackedStringArray(new_room.exits.keys())
	var messages = "\n".join(PackedStringArray([
		"You are now in " + new_room.room_name + ". it is " + new_room.room_description,
		"Exit: " + " ".join((exit_string))
	]))
	return messages
