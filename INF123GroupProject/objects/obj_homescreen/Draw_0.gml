// Reset alignment
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// TITLE SCREEN
if (state == "title") {
    draw_set_font(title_font);

    // Title outline
    var title_text = "Mystic Magic";
    var outline_size = 2;
    draw_set_color(make_color_rgb(80,200,120));
    for (var ox = -outline_size; ox <= outline_size; ox++) {
        for (var oy = -outline_size; oy <= outline_size; oy++) {
            if (ox != 0 || oy != 0) {
                draw_text(room_width/2 + ox, room_height/2 - 50 + oy, title_text);
            }
        }
    }

    // Main title
    draw_set_color(make_color_rgb(0,153,64));
    draw_text(room_width/2, room_height/2 - 50, title_text);

    // Prompt
    draw_set_font(fnt_fairy);
    draw_set_color(c_white);
    draw_text(room_width/2, room_height/2 + 30 , "Press SPACE or CLICK to continue...");
}


// MENU SCREEN
else if (state == "menu") {
    var cx = room_width / 2;
    var cy = room_height / 2;

    // Button text
    var play_text  = "Play Story";
    var exit_text  = "Exit to Safety";

    // Title outline
    draw_set_font(title_font);
    var title_text = "Mystic Magic";
    var outline_size = 2;
    draw_set_color(make_color_rgb(80,200,120));
    for (var ox = -outline_size; ox <= outline_size; ox++) {
        for (var oy = -outline_size; oy <= outline_size; oy++) {
            if (ox != 0 || oy != 0) {
                draw_text(cx + ox, cy - 120 + oy, title_text);
            }
        }
    }

    // Main title
    draw_set_color(make_color_rgb(0,153,64));
    draw_text(cx, cy - 120, title_text);

    // Buttons
    draw_set_font(fnt_fairy);

 // Play button
    if (point_in_rectangle(mouse_x, mouse_y, cx-120, cy-30, cx+120, cy+20)) {
        draw_set_color(make_color_rgb(80,200,120));
    } else draw_set_color(c_white);
    draw_text(cx, cy, play_text);

  // Exit button
    if (point_in_rectangle(mouse_x, mouse_y, cx-120, cy+20, cx+120, cy+70)) {
        draw_set_color(make_color_rgb(150,180,250));
    } else draw_set_color(c_white);
    draw_text(cx, cy + 50, exit_text);
}
// STORY SCREEN
else if (state == "story") {
    draw_set_color(c_white);
    draw_text(room_width/2, room_height/2, story_text);
    draw_text(room_width/2, room_height - 50, "Press SPACE or CLICK to continue...");
}

// HOW TO PLAY SCREEN
else if (state == "howto") {
    draw_set_color(c_white);
    draw_text(room_width/2, room_height/2, howto_text);
}
