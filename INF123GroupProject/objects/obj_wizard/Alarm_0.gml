if(wizard_health <= 50) {
	fairy_timer *= 10;
	
	if(fairy_timer > 0) {
		instance_create_layer(x, y, "Instances", obj_evil_fairy);
	} else {
		attacking = false;
	}
	
	fairy_timer--;
	
} else {
	if(fairy_timer > 0) {
		fairy_timer--;
	} else if(fairy_num > 0) {
		instance_create_layer(x, y, "Instances", obj_evil_fairy);
		fairy_timer = random_range(fairy_min, fairy_max);
		fairy_num--;
	} else {
		attacking = false;
		show_debug_message("got here");
	}
}