attack_timer--;

if(attack_timer <= 0) {
	attacking = true;
	attack_timer = random_range(300, 600); // reset timer
}

if(attacking) {
	obj_wizard.alarm[0] = 1;
}

//show_debug_message(attack_timer);

//show_debug_message(string_concat(x, ", ", y));

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