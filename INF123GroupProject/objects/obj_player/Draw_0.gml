// draws player sprite
draw_self();

// checks if player has key, if so, draw spr_key_held next to player
if(has_key) {
	draw_sprite(spr_key_held, 0, x + image_xscale, y - 16);
}

if (keyboard_check(vk_control)) //Debug Controls