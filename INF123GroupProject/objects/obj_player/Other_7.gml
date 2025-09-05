// this is called after player jump animation is finished
if(ev_animation_end and sprite_index == spr_green_jump) {
	sprite_index = spr_green_idle;
}

if(ev_animation_end and sprite_index == spr_white_jump) {
	sprite_index = spr_white_idle;
}