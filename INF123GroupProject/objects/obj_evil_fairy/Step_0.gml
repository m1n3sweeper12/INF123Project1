target_x = obj_player.x;

if(not bombing) {
	if(x < target_x) {
		xvel = 1;
	} else if(x > target_x) {
		xvel = -1;
	} else {
		obj_evil_fairy.alarm[0] = 1;
		bombing = true;
		timer = 60;
	}

	if(abs(yvel) >= 2) {
		y_dir *= -1;
	}

	yvel += (0.1*y_dir);
} else {
	xvel = 0;
	yvel = 0;
	sprite_index = spr_evil_fairy_dive;
	timer--;
	if(timer <= 0) {
		yvel = 8;
	}
}

x += xvel;
y += yvel;