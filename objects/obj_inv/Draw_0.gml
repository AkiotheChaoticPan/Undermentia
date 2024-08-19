/// @description Insert description here

if (global._e != 1) {
	visible = false;
}

if (visible) {
	global.inv = true;
}

// dynamics with width and height

var _new_w = 0;
for (var _i = 0; _i < inv_length; _i++) {
    var _op_w = string_width(inv[_i].name);  // Access item name for width calculation
    _new_w = max(_new_w, _op_w);
}

w = _new_w + inv_border * 22;
h = inv_border * 18 + string_height(inv[0].name) + (inv_length - 1) * inv_space;

// set menu to the center
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - w / 2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - h / 2;

draw_sprite_ext(sprite_index, image_index, x, y, w / sprite_width, h / sprite_height, 0, c_white, 1);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

// selected text and draw the soul next to it
for (var _i = 0; _i < inv_length; _i++) {
    var _c = c_white;
    if (pos == _i) {
	
		
		// Calculate soul position and draw it
		var _soul_x = x - 3; // Adjust for padding between the soul and the menu
		var _soul_y = y + inv_border + inv_space * _i + (string_height(inv[_i].name) - sprite_get_height(spr_soul) * 0.09) / 2;
        draw_sprite_ext(spr_soul, 0, _soul_x, _soul_y, 0.09, 0.09, 0, c_white, 1);  // Draw the soul sprite
    }
    
    // Draw the name of the item from the inv array
    draw_text_color(x + inv_border, y + inv_border + inv_space * _i, inv[_i].name, _c, _c, _c, _c, 1);
}
