/// @description Insert description here

if (global._e != 1) {
    visible = false;
}

if (visible) {
    global.inv = true;
}

// Calculate inventory width and height
var _new_w = 0;
for (var _i = 0; _i < inv_length; _i++) {
    var _op_w = string_width(inv[_i].name);  // Access item name for width calculation
    _new_w = max(_new_w, _op_w);
}

w = _new_w + inv_border * 22;
h = inv_border * 18 + string_height(inv[0].name) + (inv_length - 1) * inv_space;

// Set menu to the center
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - w / 2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - h / 2;

draw_sprite_ext(sprite_index, image_index, x, y, w / sprite_width, h / sprite_height, 0, c_white, 1);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

var soul_x = 0;
var soul_y = 0;



    // Draw inventory items
    for (var _i = 0; _i < inv_length; _i++) {
        var _c = c_white;
        if (pos == _i) {
			
            soul_x = x - 2;
            soul_y = y + inv_border + inv_space * _i + (string_height(inv[_i].name) - sprite_get_height(spr_soul) * 0.09) / 2;
        }
		draw_sprite_ext(spr_soul, 0, soul_x, soul_y, 0.09, 0.09, 0, c_white, 1);
        draw_text_color(x + inv_border, y + inv_border + inv_space * _i, inv[_i].name, _c, _c, _c, _c, 1);
    }
 

    // Draw options horizontally
    var _current_x = x + inv_space + inv_border;  // Starting x position

	for (var _i = 0; _i < op_length; _i++) {
	    var _c = c_white;
    
	    if (sec_pos == _i) {
	        soul_x = _current_x - sprite_get_width(spr_soul) * 0.09; // Adjust for padding between the heart and the text
	        soul_y = y + h - 37;
	    }
		if (a) { // draw only after an item was selected
			draw_sprite_ext(spr_soul, 0, soul_x, soul_y, 0.09, 0.09, 0, c_white, 1);
		}
	    draw_text_color(_current_x, y + h - 35, option[_i], _c, _c, _c, _c, 1);
    
	    // Update the x position for the next option
	    _current_x += string_width(option[_i]) + inv_space * 5.5;
	}




