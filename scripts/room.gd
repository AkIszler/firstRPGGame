extends PanelContainer

class_name GameRoom

@export var room_name : String = "Room Name"
@export var room_description : String = "This is the room description" 


var exits: Dictionary = {};



func connect_exit(direction: String, room: String):
    match direction:
        "west":
            exits[direction] = room
            