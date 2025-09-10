// this alarm is for pixelating out of a portal

// plays portal exit sound
if(pixels == 120 && room != cutscene) {
	audio_play_sound(sfx_teleport_in, 1, false);
}

if(pixels > 1) {
	var effect = layer_get_fx("Effect_1");
	
	fx_set_parameter(effect, "g_CellSize", pixels);

	pixels--;
	
	obj_game.alarm[1] = 1;
} else {
	if(room == level_1) {
		audio_play_sound(sfx_lvl1_bg, 2, true);
	} else if(room == level_3) {
		audio_play_sound(sfx_lvl3_bg, 2, true);
	} else if(room == level_2) {
		audio_play_sound(sfx_lvl2_bg, 2, true);
	}
}