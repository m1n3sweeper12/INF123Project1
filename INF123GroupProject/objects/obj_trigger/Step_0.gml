if(move_timer == 0) {
	show_debug_message("got here");
	var new_x = random_range(100, room_width - 100);
	var new_y = random_range(100, room_height - 100);
	
	while(abs(new_x - obj_player.x) < 200) {
		new_x = random_range(100, room_width - 100);
	}
	
	while(abs(new_y - obj_player.y) < 200) {
		new_y = random_range(100, room_height - 100);
	}

	x = instance_nearest(new_x, new_y, obj_trigger_spots).x;
	y = instance_nearest(new_x, new_y, obj_trigger_spots).y;
	
	active = true;
	move_timer = -1;
}

if(move_timer > 0) {
	move_timer--;
}