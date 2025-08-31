// check if door is locked, if so, print locked message
if(obj_player.alarm[0] == 0) {
	text_timer--;
	draw_text_transformed(500, 620, "The door is locked!", 2, 2, 0);
	
	// timer to remove text after 500 steps
	if(text_timer <= 0) {
		obj_player.alarm[0] = -1;
		text_timer = 500;
	}
}

// draws player health
draw_healthbar(20, 20, 120, 40, health, c_grey, c_maroon, c_green, 0, true, true);