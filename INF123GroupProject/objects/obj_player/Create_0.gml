// variables for move and jump speed
xvel = 0;
yvel = 0;
plrsp = 4;
jump_height = 6;
jump_timer = 1;
gravity_mod = 0.2;

// ***NOTE: temp player sprite has a width of 16 pixels and a height of 24 pixels***
// these variables should be set to the width and height of the actual sprite, not necessarily
// the sprite image (ie the sprite image is 32x32, but the sprite is only 16x24)
width = 23;
height = 32;

// set player health
//health = 30;

// variable to control jumps
falling = true;
landed = false;

// variable to track player movement
// added for portal animation
canMove = true;

// variables to track player jumps
canJump = true;
jumpCnt = 0;
maxJumps = 2;
canDash = true;

// variable to control key
has_key = false;

// add leaf trail
part_system_create(leaf_trail);
part_timer = random_range(50, 100);

text_timer = 500;
//start health
health = 100;
max_health = 100;

// Invincibility cooldown
invincible = 0;

// Fairy Type:
	// 0 is forest
	// 1 is air
fairy_type = 0; 

alpha_val = 0;


// The function that stops the white fairy's dash.
function KillDash() 
{
	plrsp = 4;
	falling = true;
	gravity_mod = 0.2;
}