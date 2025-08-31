// adds gravity to the player
if(falling) {
	if(yvel < obj_game.world_gravity) {
		yvel += 0.2; // adds 0.2 until it reaches gravity limit (set in obj_game Create)
	}
} else { // if not falling, reset yvel
	yvel = 0;
}

// handles keyboard input
xvel = keyboard_check(obj_game.right_control) - keyboard_check(obj_game.left_control);

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
	image_index = 0;
	jumpCnt++;
	landed = false;
	yvel = -jump_height;
	falling = true;
}

// check if player has jumped max count
// if so, lock jumps until platform collision
if(jumpCnt >= maxJumps) {
	jumpCnt = maxJumps;
	canJump = false;
}

// check if player walked off of platform
if(x > instance_nearest(x, y, obj_platform).bbox_right or x < instance_nearest(x, y, obj_platform).bbox_left) and landed {
	falling = true;
	landed = false;
}

// everything below this point handles platform collision
var collision = move_and_collide(xvel * plrsp, yvel, obj_platform, 4, 0, 0, plrsp, obj_game.world_gravity);

// this checks if the player has collided with an object
// ***NOTE: need to fix player clipping with sides of platforms***
if not(array_length(collision) == 0) {
	// if yes and player y is < collided platform's y, then set player y to platform y - player height
	// and set y velocity to 0
	// also resets falling, canJump, and jumpCnt variables
	if(y < array_last(collision).y) {
		y = array_last(collision).y - height;
		yvel = 0;
		falling = false;
		canJump = true;
		jumpCnt = 0;
		landed = true;
	}
	// if yes and player y is > collided platform's y, then set player y to platform y + platform height
	// and set y velocity to 0, falling to true
	if(y > array_last(collision).y) {
		y = array_last(collision).y + 17; // platform is 16 pixels tall
		yvel = 0;
		falling = true;
	}
}