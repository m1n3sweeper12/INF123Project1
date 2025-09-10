// adds gravity to the enemy
if(falling) {
	if(yvel < obj_game.world_gravity) {
		yvel += 0.2; // adds 0.2 until it reaches gravity limit (set in obj_game Create)
	}
} else { // if not falling, reset yvel
	yvel = 0;
}

// everything below this point handles platform collision
var collision = move_and_collide(xvel * ensp, yvel, obj_platform, 4, 0, 0, ensp, obj_game.world_gravity);

// this checks if the enemy has collided with an object
// ***NOTE: need to fix enemy clipping with sides of platforms***
if not(array_length(collision) == 0) {
	// if yes and enemy y is < collided platform's y, then set enemy y to platform y - enemy height
	// and set y velocity to 0
	// also resets falling and canJump variables
	if(y < array_last(collision).y) {
		y = array_last(collision).y - height;
		yvel = 0;
		falling = false;
		canJump = true;
	}
	// if yes and enemy y is > collided platform's y, then set enemy y to platform y + platform height
	// and set y velocity to 0, falling to true
	if(y > array_last(collision).y) {
		y = array_last(collision).y + 17; // platform is 16 pixels tall
		yvel = 0;
		falling = true;
	}
}