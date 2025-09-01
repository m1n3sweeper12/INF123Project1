// adds gravity to the player
if(falling) {
	if(yvel < obj_game.world_gravity) {
		yvel += 0.2; // adds 0.2 until it reaches gravity limit (set in obj_game Create)
	}
} else { // if not falling, reset yvel
	yvel = 0;
}

// handles keyboard input
xvel = (keyboard_check(obj_game.right_control) - keyboard_check(obj_game.left_control))*plrsp;

// handles player turning
if(xvel < 0) {
	image_xscale = -1;
}

if(xvel > 0) {
	image_xscale = +1;
}

// if player presses up control, add to jump count, allow player jump, set falling to true
if(keyboard_check_pressed(obj_game.up_control) and canJump) {
	sprite_index = spr_green_jump; // this changes the player's sprite to the jump sprite
	//audio_play_sound(sfx_jump, 1, false);
	image_index = 0;
	jumpCnt++;
	landed = false;
	yvel = -(jump_height*jump_timer);
	falling = true;
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

//// get tilemap id for collision tiles
//var tilemap_id = layer_tilemap_get_id("Collision_Tiles");

//// check for left tile collision
//if(tilemap_get_at_pixel(tilemap_id, x - width - 2, y)) {
//	// if left and bottom collision, adjust y
//	if(tilemap_get_at_pixel(tilemap_id, x, y)) {
//		y -= 2;
//	}
//	// stop x movement, adjust x
//	xvel = 0;
//	x++;
//}

//// check for right tile collision
//if(tilemap_get_at_pixel(tilemap_id, x + width + 2, y)) {
//	// if right and bottom collision, adjust y
//	if(tilemap_get_at_pixel(tilemap_id, x, y)) {
//		y -= 2;
//	}
//	// stop x movement, adjust x
//	xvel = 0;
//	x--;
//}

//// check for top tile collision ("hit head")
//if(tilemap_get_at_pixel(tilemap_id, x, y - sprite_get_bbox_top(sprite_index) - 16)) {
//	// stop y movement, adjust y, set falling to true
//	y += 2;
//	yvel = 0;
//	falling = true;
//}

//// check for bottom tile collision ("landed")
//if(tilemap_get_at_pixel(tilemap_id, x, y)) {
//	// set falling to false, landed to true, reset jump variables, stop y moevment, adjust y
//	falling = false;
//	yvel = 0;
//	landed = true;
//	jumpCnt = 0;
//	y -= 2;
//	canJump = true;
//	audio_play_sound(sfx_land, 1, false);
//}

//// check if player walked off of a tile
//if not(tilemap_get_at_pixel(tilemap_id, x, y + 2)) {
//	falling = true;
//}

// check for collisions with tile object
var collision = move_and_collide(xvel, yvel, obj_tile, 4, 0, 0, plrsp, obj_game.world_gravity);

// if there is a collision, check for adjustments
if not(array_length(collision) == 0) {
	
	if(place_meeting(x, y + height, obj_tile) or place_meeting(x, y - height, obj_tile)) {
		// player landed
		if(place_meeting(x, y + height, obj_tile)) {
			yvel = 0;
			landed = true;
			falling = false;
			jumpCnt = 0;
			canJump = true;
			y -= 2;
		}
	
		// player hits bottom of platform ("hit head")
		if(place_meeting(x, y - height, obj_tile)) {
			yvel = 0;
			falling = true;
			y += 2;
		}
	} else if(place_meeting(x - width, y, obj_tile) or place_meeting(x + width, y, obj_tile)) {
	
		// left collision
		if(place_meeting(x - width, y, obj_tile)) {
			xvel = 0;
			x += 2;
		}
	
		// right collision
		if(place_meeting(x + width, y, obj_tile)) {
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


