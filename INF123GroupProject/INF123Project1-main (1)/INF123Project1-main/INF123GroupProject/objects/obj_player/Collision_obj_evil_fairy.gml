if(invincible == 0) {
	health -= 5;
	invincible = 1;
	audio_play_sound(sfx_hurt, 1, false);
	// alarm for hurt sprite
	obj_player.alarm[2] = 1;
	instance_destroy(other);
}