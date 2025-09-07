if(hurt_timer == 60) {
	audio_stop_all();
	audio_play_sound(sfx_die, 1, false);
	// sprite_index = spr_green_die;
}
hurt_timer--;

if(hurt_timer <= 0) {
	instance_destroy(); // or go to game over room
    room_restart();
}

// NOTE: this is probably a temporary spot for this, since ideally it would just play after the animation ends

