attack_timer--;

if(attack_timer <= 0) {
	attacking = true;
	audio_play_sound(sfx_wizard_attack, 1, false);
	effect_create_below(ef_cloud, x, y, 50, c_grey);
	effect_create_below(ef_ellipse, x, y, 10, c_red);
	fairy_num = random_range(fairy_min, fairy_max);
	attack_timer = random_range(150, 300); // reset timer
}

if(attacking) {
	obj_wizard.alarm[0] = 1;
	
}

image_xscale = (obj_player.x < obj_wizard.x) ? -1: 1;

// sprite bobbing
if(abs(yvel) >= 1.5) {
	y_dir *= -1;
}

yvel += (0.1*y_dir);

y += yvel;

if(shake_timer > 0) {
	shake_timer--;
} else {
	layer_set_visible("shake", false);
}

if(wizard_health <= 0) {
	room_goto_next();
}