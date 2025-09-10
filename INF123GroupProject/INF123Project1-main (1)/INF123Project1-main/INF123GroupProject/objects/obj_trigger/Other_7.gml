if(ev_animation_end and sprite_index == spr_gem_powerdown) {
	sprite_index = spr_gem_idle_down;
}

if(ev_animation_end and sprite_index == spr_gem_powerup) {
	sprite_index = spr_gem_idle;
}