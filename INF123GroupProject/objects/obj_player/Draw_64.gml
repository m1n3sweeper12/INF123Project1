// check if door is locked, if so, print locked message
if(obj_player.alarm[0] == 0) {
	text_timer--;
	draw_set_alpha(0.75);
	draw_set_color(c_black);
	draw_roundrect_ext(view_wport[0]/2 - 200, 600,
						view_wport[0]/2 + 200, 680, 20, 20, false);
	draw_set_color(c_white);
	draw_text_transformed(view_wport[0]/2, 640, "The door is locked!", 2, 2, 0);
	
	// timer to remove text after 500 steps
	if(text_timer <= 0) {
		obj_player.alarm[0] = -1;
		text_timer = 500;
	}
}

// draws player health
if(room == level_3) {
	draw_healthbar(20, 20, 120, 40, health, c_grey, c_maroon, c_green, 0, true, true);
}
// reset alpha value
draw_set_alpha(1);