/// @description

var _delta = delta_time / 1000000;
var _move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var _move_y = keyboard_check(vk_down) - keyboard_check(vk_up);

var _new_x = x + (_move_x * movement_speed * _delta);
var _new_y = y + (_move_y * movement_speed * _delta);

if (_move_x != 0) {
	is_moving = true;
    dir = (_move_x > 0) ? DIRECTION.RIGHT : DIRECTION.LEFT;
    set_animation((_move_x > 0) ? "right" : "left");
	if (check_collision(_new_x, _new_y)) {
		x = _new_x;
		y = _new_y;
	}
} else if (_move_y != 0) {
	is_moving = true;
    dir = (_move_y > 0) ? DIRECTION.DOWN : DIRECTION.UP;
    set_animation((_move_y > 0) ? "down" : "up");
	if (check_collision(_new_x, _new_y)) {
		x = _new_x;
		y = _new_y;
	}
} else {
    is_moving = false;
	image_index = animation_frames[0]; // Set the appropriate idle animation
}

// Please ignore this complete mess. It is hideous. I know.
// We can crunch it down later, for now it's not important.
function check_collision(_dx, _dy) {
    var _map_id = layer_tilemap_get_id(layer_get_id("Collision"));
    
    var new_bbox_left = bbox_left + _dx;
    var new_bbox_right = bbox_right + _dx;
    var new_bbox_top = bbox_top + _dy;
    var new_bbox_bottom = bbox_bottom + _dy;

    if (dir == DIRECTION.DOWN) {
        var _l_bottom = tilemap_get_at_pixel(_map_id, bbox_left, new_bbox_bottom);
        var _r_bottom = tilemap_get_at_pixel(_map_id, bbox_right, new_bbox_bottom);
        if (_l_bottom != 0 || _r_bottom != 0) return true;

    } else if (dir == DIRECTION.LEFT) {
        var _l_top = tilemap_get_at_pixel(_map_id, new_bbox_left, bbox_top);
        var _l_bottom = tilemap_get_at_pixel(_map_id, new_bbox_left, bbox_bottom);
        if (_l_top != 0 || _l_bottom != 0) return true;

    } else if (dir == DIRECTION.RIGHT) {
        var _r_top = tilemap_get_at_pixel(_map_id, new_bbox_right, bbox_top);
        var _r_bottom = tilemap_get_at_pixel(_map_id, new_bbox_right, bbox_bottom);
        if (_r_top != 0 || _r_bottom != 0) return true;

    } else if (dir == DIRECTION.UP) {
        var _l_top = tilemap_get_at_pixel(_map_id, bbox_left, new_bbox_top);
        var _r_top = tilemap_get_at_pixel(_map_id, bbox_right, new_bbox_top);
        if (_l_top != 0 || _r_top != 0) return true;
    }
    
    return false;
}