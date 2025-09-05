// this is called after player jump animation is finished
if(ev_animation_end and obj_player.sprite_index == spr_green_jump) {
	sprite_index = spr_green_idle;
}

// switches player animation back to normal after hurt
// when idle
if(ev_animation_end and obj_player.sprite_index == spr_green_idle_hurt) {
	var index = obj_player.image_index;
	obj_player.sprite_index = spr_green_idle;
	obj_player.image_index = index;
}

// when jumping
if(ev_animation_end and obj_player.sprite_index == spr_green_jump_hurt) {
	var index = obj_player.image_index;
	obj_player.sprite_index = spr_green_jump;
	obj_player.image_index = index;
}