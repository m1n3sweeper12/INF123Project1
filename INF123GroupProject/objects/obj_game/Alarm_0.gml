// this alarm is for pixelating into a portal

// plays portal entrance sound
if(pixels == 1) {
	audio_stop_all();
	audio_play_sound(sfx_teleport_out, 1, false);
}

if(pixels < 120) {
	var effect = layer_get_fx("Effect_1");
	
	fx_set_parameter(effect, "g_CellSize", pixels);
	
	pixels++;
	
	obj_game.alarm[0] = 1;
} else {
	room_goto_next();
}