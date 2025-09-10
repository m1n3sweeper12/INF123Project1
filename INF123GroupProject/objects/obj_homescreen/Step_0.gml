if (state == "title") {
    if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
        state = "menu";
    }
}
else if (state == "menu") {
    var cx = room_width/2;
    var cy = room_height/2;

    var play_left   = cx - 120, play_top = cy - 30, play_right = cx + 120, play_bottom = cy + 20;
    var fairy_left  = cx - 120, fairy_top = cy + 20, fairy_right = cx + 120, fairy_bottom = cy + 70;
    var exit_left   = cx - 120, exit_top = cy + 90, exit_right = cx + 120, exit_bottom = cy + 140;

    if (mouse_check_button_pressed(mb_left)) {
        if (point_in_rectangle(mouse_x, mouse_y, play_left, play_top, play_right, play_bottom)) {
            state = "story";
		}
        if (point_in_rectangle(mouse_x, mouse_y, exit_left, exit_top, exit_right, exit_bottom)) {
            game_end();
        }
    }
}
else if (state == "story") {
    if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
        state = "howto";
    }
}
else if (state == "howto") {
    if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
        room_goto(level_1); //  first level
    }
}
