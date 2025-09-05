if(obj_player.alarm[1] == 0) {
	room_goto_next();
} else if(obj_player.alarm[1] > 0) {
	obj_player.alarm[1]--;
}

// adds gravity to the player
if(falling) {
	if(yvel < obj_game.world_gravity) {
		yvel += 0.2; // adds 0.2 until it reaches gravity limit (set in obj_game Create)
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

if(keyboard_check_pressed(obj_game.up_control) and (fairy_type = 1) and (falling = true)) {
	plrsp = plrsp*1.5;
}

/*
if(keyboard_check(obj_game.up_control) and canJump) {
	jump_timer += 0.02;
}

if(landed) {
	jump_timer = 1;
}
*/

// check if player has jumped max count
// if so, lock jumps until platform collision

if(jumpCnt >= maxJumps) {
	jumpCnt = maxJumps;
	canJump = false;
}

if (fairy_type = 0){ //if forrect
 
}
else if (fairy_type = 1){ //if air

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
			plrsp = 4;
			y -= 2;
		}
	
		// player hits bottom of platform ("hit head")
		if(place_meeting(x, y - 2, obj_tile)) {
			yvel = 0;
			falling = true;
			y += 2;
		}
	} else if(place_meeting(x - 2, y, obj_tile) or place_meeting(x + 2, y, obj_tile)) {
	
		// left collision
		if(place_meeting(x - 2, y, obj_tile)) {
			xvel = 0;
			x += 2;
		}
	
		// right collision
		if(place_meeting(x + 2, y, obj_tile)) {
			xvel = 0;
			x -= 2;
		}
	}
	
} else {
	// check if player walked off tile
	if not(place_meeting(x, y + height, obj_tile)) {
		falling = true;
	}
}

//change x and y with xvel and yvel
//y += yvel;
//x += xvel;

// create leaf particle trail
part_timer--;
if(part_timer <= 0) {
	part_particles_burst(0, x, y - 16, leaf_trail);
	part_timer = random_range(50, 100);
}

//checks players health
if (health <= 0) {
    // Player dies
    instance_destroy(); // or go to game over room
    room_goto(level_1); 
}
// Reduce invincibility timer every step
if (invincible > 0) {
    invincible -= 1;
}