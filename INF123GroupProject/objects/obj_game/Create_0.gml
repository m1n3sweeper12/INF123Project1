// variable to control the max speed entities can fall at
world_gravity = 9.8

// variables for chosen controls
left_control = ord("A");
right_control = ord("D");
up_control = ord("W");

obj_game.alarm[1] = 1;

pixels = 120;

if(room == cutscene) {
	var sequence = layer_sequence_create("Sequence", room_width/2, room_height/2, wizard_cutscene);
	layer_sequence_play(sequence);
}