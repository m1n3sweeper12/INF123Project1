var index = obj_player.image_index;
if(obj_player.sprite_index == spr_green_idle) {
	obj_player.sprite_index = spr_green_idle_hurt;
	obj_player.image_index = index;
}
canDash = false;
KillDash();
