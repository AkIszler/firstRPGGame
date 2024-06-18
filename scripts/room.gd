extends PanelContainer

class_name GameRoom

@export var room_name : String = "Room Name"
@export var room_description : String = "This is the room description" 


var exits: Dictionary = {};



func connect_exit(direction: String, room):
    match direction:
        "west":
            exits[direction] = room
            room.exits["east"] = self

        "east": 
            exits[direction] = room
            room.exits["east"] = self


        "north":
            exits[direction] = room
            room.exits["south"] = self

        "south":
            exits[direction] = room
            room.exits["north"] = self

        _: printerr("you tried to go an invalid direction: %s", direction)    