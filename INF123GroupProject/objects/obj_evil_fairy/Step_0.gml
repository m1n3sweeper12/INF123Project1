target_x = obj_player.x;

if(not bombing) {
	if(ceil(x) < target_x - 2) {
		xvel = x_speed;
		image_xscale = -1;
	} else if(floor(x) > target_x + 2) {
		image_xscale = 1;
		xvel = -x_speed;
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
	if(timer == 60) {
		y_dir = (obj_player.y < y) ? -1: 1;
		image_yscale = y_dir;
	}
	timer--;
	if(timer <= 0) {
		yvel = 8*y_dir;
	}
}

x += xvel;
y += yvel;