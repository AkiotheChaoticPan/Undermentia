/// @description Insert description here
// You can write your code in this editor


if (global._e != 3) {
	visible = false;
}


// dynamics with width and height

var _new_w = 0;
for (var _i = 0; _i < op_length; _i++) {
    var _op_w = string_width(option[_i]);
    _new_w = max(_new_w, _op_w);
}

w = _new_w + op_border * 22;
h = op_border * 18 + string_height(option[0]) + (op_length - 1) * op_space;

// set menu to the center
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - w / 2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - h / 2;

draw_sprite_ext(sprite_index, image_index, x, y, w / sprite_width, h / sprite_height, 0, c_white, 1);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Change color of selected text and draw the soul next to it
for (var _i = 0; _i < op_length; _i++) {
    var _c = c_white;
    if (pos == _i) {
        _c = c_yellow;
		// Calculate soul position and draw it
		var _soul_x = x - 2; // Adjust -5 for padding between the soul and the menu
		// y + 22 * _i - 5
		var _soul_y = y + op_border + op_space * _i + (string_height(option[_i]) - sprite_get_height(spr_soul) * 0.09) / 2;
        
        draw_sprite_ext(spr_soul, 0, _soul_x, _soul_y, 0.09, 0.09, 0, c_white, 1);
    }
    draw_text_color(x + op_border, y + op_border + op_space * _i, option[_i], _c, _c, _c, _c, 1);
}