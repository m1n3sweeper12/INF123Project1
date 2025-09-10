if(keyboard_check_pressed(vk_space) or mouse_check_button_pressed(1)) {
	audio_stop_all();
	room_goto(homescreen);
}