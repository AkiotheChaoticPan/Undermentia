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
	if (check_collision(movement_speed * _delta)) {
		x = _new_x;
		y = _new_y;
	}
} else if (_move_y != 0) {
	is_moving = true;
    dir = (_move_y > 0) ? DIRECTION.DOWN : DIRECTION.UP;
    set_animation((_move_y > 0) ? "down" : "up");
	if (check_collision(movement_speed * _delta)) {
		x = _new_x;
		y = _new_y;
	}
} else {
    is_moving = false;
	image_index = animation_frames[0]; // Set the appropriate idle animation
}

// Please ignore this complete mess. It is hideous. I know.
// We can crunch it down later, for now it's not important.
function check_collision(_change) {
	var _map_id = layer_tilemap_get_id(layer_get_id("Collision"));
    
	if (dir == DIRECTION.DOWN) {
		var _l_bottom = tilemap_get_at_pixel(_map_id, bbox_left - _change, bbox_bottom);
		var _r_bottom = tilemap_get_at_pixel(_map_id, bbox_right + _change, bbox_bottom);
		if (_l_bottom == 0 && _r_bottom == 0) return true;
		
	} else if (dir == DIRECTION.LEFT) {
		var _l_top = tilemap_get_at_pixel(_map_id, bbox_left - _change, bbox_top);
		var _l_bottom = tilemap_get_at_pixel(_map_id, bbox_left - _change, bbox_bottom);
		if (_l_top == 0 && _l_bottom == 0) return true;	
		
	} else if (dir == DIRECTION.RIGHT) {
		var _r_top = tilemap_get_at_pixel(_map_id, bbox_right + _change, bbox_top);
		var _r_bottom = tilemap_get_at_pixel(_map_id, bbox_right + _change, bbox_bottom);
		if (_r_top == 0 && _r_bottom == 0) return true;
		
	} else if (dir == DIRECTION.UP) {
		var _l_top = tilemap_get_at_pixel(_map_id, bbox_left - _change, bbox_top);
		var _r_top = tilemap_get_at_pixel(_map_id, bbox_right + _change, bbox_top);
		if (_l_top == 0 && _r_top == 0) return true;
	}
	show_debug_message("Failed");
	return false;
}