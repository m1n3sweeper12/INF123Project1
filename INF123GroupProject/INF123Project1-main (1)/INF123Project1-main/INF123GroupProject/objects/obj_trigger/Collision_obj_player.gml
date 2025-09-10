if(active) {
	move_timer = 1200;
	audio_play_sound(sfx_rumble, 2, false);
	audio_play_sound(sfx_trigger_down, 1, false);
	obj_wizard.alarm[1] = 1;
}

active = false;

if(sprite_index == spr_gem_idle) {
	sprite_index = spr_gem_powerdown;
	image_index = 0;
}