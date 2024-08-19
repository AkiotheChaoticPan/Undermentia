

// dynamics with width and height
var _new_w = 0;
for (var _i = 0; _i < op_length; _i++) {
    var _op_w = string_width(option[_i]);
    _new_w = max(_new_w, _op_w);
}

w = _new_w + op_border * 2;
h = op_border * 2 + string_height(option[0]) + (op_length - 1) * op_space;

// set menu to the left center
x = camera_get_view_x(view_camera[0]) + 20;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - h / 2;

draw_sprite_ext(sprite_index, image_index, x, y, w / sprite_width, h / sprite_height, 0, c_white, 1);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Variable to track heart's position
var heart_x = 0;
var heart_y = 0;

// Freeze heart position when obj_inv, obj_stat, or obj_cell is visible
var freeze_heart = (global.inv || global.stats || global.cell);

// Change color of selected text and draw the heart next to it
for (var _i = 0; _i < op_length; _i++) {
    var _c = c_white;
    
    if (pos == _i && !freeze_heart) {
        // If no objects are visible, calculate the heart's position
        

        // Calculate heart position
        heart_x = x - 2; // Adjust for padding between the heart and the menu
        heart_y = y + op_border + op_space * _i + (string_height(option[_i]) - sprite_get_height(spr_soul) * 0.09) / 2;
    }

    // Draw the heart at the frozen position or updated position
    draw_sprite_ext(spr_soul, 0, heart_x, heart_y, 0.09, 0.09, 0, c_white, 1);

    // Draw the menu option text
    draw_text_color(x + op_border, y + op_border + op_space * _i, option[_i], _c, _c, _c, _c, 1);
}
