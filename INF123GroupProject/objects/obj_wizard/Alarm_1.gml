wizard_health -= 10;

sprite_index = spr_wizard_hurt;
audio_play_sound(sfx_wizard_hurt, 1, false);
effect_create_above(ef_explosion, x, y, 10, c_white);

attacking = false;
attack_timer = 1000;

layer_set_visible("shake", true);
shake_timer = 250;