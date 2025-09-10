if(obj_player.alarm[1] == 0) {
	room_goto_next();
} else if(obj_player.alarm[1] > 0) {
	obj_player.alarm[1]--;
}

// adds gravity to the player
if(falling) {
	if(yvel < obj_game.world_gravity) {
		yvel += gravity_mod; // adds 0.2 until it reaches gravity limit (set in obj_game Create)
	}
} else { // if not falling, reset yvel
	yvel = 0;
}


var l138FF398_0 = instance_place(x + 0, y + 0, [obj_obstacle]);
if ((l138FF398_0 > 0))
{
	// Hurt knockback
	
	xvel = -(keyboard_check(obj_game.right_control) - keyboard_check(obj_game.left_control))*(plrsp/1.5);

	landed = false;
	canMove = false;
	canJump = false;
	yvel = -(jump_height*(2/3));
	falling = true;
	
} else if(invincible == 0) & (canMove) {
	
	//Player movement
	xvel = (keyboard_check(obj_game.right_control) - keyboard_check(obj_game.left_control))*plrsp;
}


// handles player turning
if(xvel < 0) {
	image_xscale = -1;
}

if(xvel > 0) {
	image_xscale = +1;
}

// if player presses up control, add to jump count, allow player jump, set falling to true
if(keyboard_check_pressed(obj_game.up_control) and canJump) {
	
	audio_play_sound(sfx_jump, 1, false);
	jumpCnt++;
	landed = false;
	yvel = -(jump_height);
	falling = true;
	
	if (fairy_type = 0){				//Determines which sprites to use when in which mode
		sprite_index = spr_green_jump; 
		image_index = 0;
	} else if (fairy_type = 1){
		sprite_index = spr_white_jump; 
		image_index = 0;
	}

}


// Wind Fairy dash
if(keyboard_check_pressed(obj_game.up_control) and (fairy_type = 1) and (landed = false) and (canJump = false) and (canDash = true)) {
	plrsp = plrsp*3;
	falling = false;
	yvel = 0;
	gravity_mod = 0;
	alarm_set(4, 15);
}

if(keyboard_check_released(obj_game.up_control) and (fairy_type = 1)){
	KillDash();
}

// Resets speed when dash is off.
if (canDash = false){
	plrsp = 4;
}


// check if player has jumped max count
// if so, lock jumps until platform collision
if(jumpCnt >= maxJumps) {
	jumpCnt = maxJumps;
	canJump = false;
}



if (fairy_type = 0){ //if forrect
	if(jumpCnt == 1){
		plrsp = 3;
	} else if(jumpCnt == 2){
		plrsp = 2;
	} else {
		plrsp = 4;
	}
} else if (fairy_type = 1){ //if air
	//temp
}

// check for collisions with tile object
var collision = move_and_collide(xvel, yvel, obj_tile, 4, 0, 0, plrsp, obj_game.world_gravity);

// if there is a collision, check for adjustments
if not(array_length(collision) == 0) {
	
	if(place_meeting(x, y + 2, obj_tile) or place_meeting(x, y - 2, obj_tile)) {
		// player landed
		if(place_meeting(x, y + 2, obj_tile)) {
			yvel = 0;
			canMove = true;
			landed = true;
			falling = false;
			jumpCnt = 0;
			canJump = true;
			canDash = true;
			plrsp = 4;
			y -= 2;
		}
	
		// player hits bottom of platform ("hit head")
		if(place_meeting(x, y - 2, obj_tile)) {
			yvel = 0;
			falling = true;
			KillDash();
			y += 2;
		}
	} else if(place_meeting(x - 2, y, obj_tile) or place_meeting(x + 2, y, obj_tile)) {
	
		// left collision
		if(place_meeting(x - 2, y, obj_tile)) {
			xvel = 0;
			x += 2;
			KillDash();
		}
	
		// right collision
		if(place_meeting(x + 2, y, obj_tile)) {
			xvel = 0;
			x -= 2;
			KillDash();
		}
	}
} else {
	// check if player walked off tile
	if not(place_meeting(x, y + height, obj_tile)) {
		falling = true;
	}
}

// handles player turning
if(xvel < 0) {
	image_xscale = -1;
}

if(xvel > 0) {
	image_xscale = +1;
}

if(keyboard_check(obj_game.up_control) and canJump) {
	jump_timer += 0.02;
}

if(landed) {
	jump_timer = 1;
}

// check if player has jumped max count
// if so, lock jumps until platform collision
if(jumpCnt >= maxJumps) {
	jumpCnt = maxJumps;
	canJump = false;
}

// create leaf particle trail
part_timer--;
if(part_timer <= 0) {
	if(fairy_type == 0) {
		part_particles_burst(0, x, y, leaf_trail);
		part_timer = random_range(50, 100);
	} else if(fairy_type == 1) {
		part_particles_burst(0, x, y, cloud_trail);
		part_timer = random_range(50, 100);
	}
}

// controls heart bar sprites
if(room == level_1 or room == level_2) {
	if(health < 30) {
		obj_hearts.sprite_index = spr_hearts_0;
	} else if(health < 60) {
		obj_hearts.sprite_index = spr_hearts_1;
	} else if(health < 100) {
		obj_hearts.sprite_index = spr_hearts_2;
	} else {
		obj_hearts.sprite_index = spr_hearts_3;
	}
}

//checks players health
if (health <= 0) {
    // Player dies
	obj_player.alarm[3] = 1; // alarm for player death
}

// Reduce invincibility timer every step
if (invincible > 0) {
    invincible -= 1;
}
