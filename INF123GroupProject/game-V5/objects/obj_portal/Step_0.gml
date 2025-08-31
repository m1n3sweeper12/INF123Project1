//if player is on top pf the portal they will teleport to room two 
//Need to add requirement that player has the key 
if (place_meeting(x, y, obj_player)) {
    room_goto(Room2); 
}