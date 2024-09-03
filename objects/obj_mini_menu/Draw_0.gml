
var _new_w = 0;
for (var _i = 0; _i < op_length; _i++) {
    var _op_w = string_width(stats[_i]);
    _new_w = max(_new_w, _op_w);
}

w = _new_w + op_border * 2;
h = op_border * 2 + string_height(stats[0]) + (op_length - 1) * op_space;

// set menu to the left center
x = camera_get_view_x(view_camera[0]) + 20;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - h / 2;

draw_sprite_ext(sprite_index, image_index, x, y + 100, w / sprite_width, h / sprite_height, 0, c_white, 1);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Change color of selected text and draw the soul next to it
for (var _i = 0; _i < op_length; _i++) {   
    draw_text(x + op_border, y + op_border + op_space * _i + 100, stats[_i]);
	
}