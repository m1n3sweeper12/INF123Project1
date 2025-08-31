// variables for move and jump speed
xvel = 0;
yvel = 0;
plrsp = 4;
jump_height = 6;
jump_timer = 1;

// ***NOTE: temp player sprite has a width of 16 pixels and a height of 24 pixels***
// these variables should be set to the width and height of the actual sprite, not necessarily
// the sprite image (ie the sprite image is 32x32, but the sprite is only 16x24)
width = 16;
height = 32;

// set player health
health = 100;

// variable to control jumps
falling = true;
landed = false;

// variables to track player jumps
canJump = true;
jumpCnt = 0;
maxJumps = 2;

// variable to control key
has_key = false;

// add leaf trail
part_system_create(leaf_trail);
part_timer = random_range(50, 100);

text_timer = 500;