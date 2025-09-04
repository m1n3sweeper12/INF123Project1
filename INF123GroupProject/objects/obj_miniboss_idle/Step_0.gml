// Reset horizontal speed
hsp = 0;

// keys that move the character
if (keyboard_check(ord("A"))) {
    hsp = -walkSpeed; // move left
}
if (keyboard_check(ord("D"))) {
    hsp = walkSpeed; // move right
}

// Jump (only if on ground)
if (keyboard_check_pressed(ord("W")) && place_meeting(x, y + 1, obj_tile)) {
    vsp = jumpSpeed;
}
// Apply gravity
vsp += grav;

//  floor collision check 
if (place_meeting(x, y + 1, obj_tile)) {
    vsp = 0;
    if (state != "idle") {
        state = "idle";
        sprite_index = spi_miniboss;
        image_speed = 1; // play idle animation
    }
} else {
    // In air
    state = "jump";
    sprite_index = spr_miniboss_jump;
    image_speed = 1; // play jump animation
}



// Apply movement
x += hsp;
y += vsp;