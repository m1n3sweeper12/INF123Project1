if (falling = false){
	if (fairy_type = 0) { //If you are forrest and switch to air
		fairy_type = 1;
		sprite_index = spr_white_idle;
		maxJumps = 1;
	}
	else if (fairy_type = 1){  //If you are air and switch to forrest
		fairy_type = 0;
		sprite_index = spr_green_idle;
		maxJumps = 2;
	}
}
