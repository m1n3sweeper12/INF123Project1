// variables for move and jump speed
xvel = 0;
yvel = 0;
ensp = 1;
jump_height = 3;

// ***NOTE: temp enemy sprite has a width of 16 pixels and a height of 24 pixels***
// these variables should be set to the width and height of the actual sprite, not necessarily
// the sprite image (ie the sprite image is 32x32, but the sprite is only 16x24)
width = 16;
height = 24;

// set enemy health
health = 10;

// variable to control jumps
falling = true;

// variables to track enemy jumps
canJump = true;