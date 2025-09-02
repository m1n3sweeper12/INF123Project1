/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 52162948
/// @DnDArgument : "code" "// draws player sprite$(13_10)draw_self();$(13_10)$(13_10)// checks if player has key, if so, draw spr_key_held next to player$(13_10)if(has_key) {$(13_10)	draw_sprite(spr_key_held, 0, x + image_xscale, y - 16);$(13_10)}$(13_10)$(13_10)"
// draws player sprite
draw_self();

// checks if player has key, if so, draw spr_key_held next to player
if(has_key) {
	draw_sprite(spr_key_held, 0, x + image_xscale, y - 16);
}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 70897CA0
/// @DnDComment : Player Hitbox Debug command. If Control is held, player's hitbox will be shown.
/// @DnDArgument : "key" "vk_control"
var l70897CA0_0;l70897CA0_0 = keyboard_check(vk_control);if (l70897CA0_0){	/// @DnDAction : YoYo Games.Drawing.Draw_Rectangle
	/// @DnDVersion : 1
	/// @DnDHash : 2E062F0F
	/// @DnDParent : 70897CA0
	/// @DnDArgument : "x1" "bbox_left"
	/// @DnDArgument : "y1" "bbox_top"
	/// @DnDArgument : "x2" "bbox_right"
	/// @DnDArgument : "y2" "bbox_bottom"
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);}