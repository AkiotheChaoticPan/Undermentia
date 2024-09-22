/// @description

var _delta = delta_time / 1000000;
var _move_x = check_right() - check_left();
var _move_y = check_down() - check_up();

var _new_x = x + (_move_x * movement_speed * _delta);
var _new_y = y + (_move_y * movement_speed * _delta);

#region Movement

/* This collision is not ideal at all, but it works well enough for what we need right now.
 * Inefficient, but basic and snappy. We can overhaul it later! */
if (!place_meeting(_new_x, y, collision_map)) x = _new_x;
if (!place_meeting(x, _new_y, collision_map)) y = _new_y;

if (keyboard_check(vk_tab)) {
	fade_screen(1, #ffffff, 0.5);	
}

// Set Direction & Get Animation
if (_move_x != 0) {
	is_moving = true;
	dir = (_move_x > 0) ? DIRECTION.RIGHT : DIRECTION.LEFT;
	get_animation((_move_x > 0) ? "right" : "left");
} else if (_move_y != 0) {
	is_moving = true;
	dir = (_move_y > 0) ? DIRECTION.DOWN : DIRECTION.UP;
	get_animation((_move_y > 0) ? "down" : "up");
} else {
	is_moving = false;
	image_index = animation_frames[0]; // Sets the appropriate idle animation
}

#endregion

#region Interacting
function can_interact() {
	//TODO: Add checking conditions for interacting with objects (is in dialogue, etc...)
	return true;
}
var _x_offset = _move_x * collided_length;
var _y_offset = _x_offset != 0 ? 0 : _move_y * collided_length;

if(_x_offset == 0 && _y_offset == 0) {
	_x_offset = last_x_offset;
	_y_offset = last_y_offset;
}

last_x_offset = _x_offset;
last_y_offset = _y_offset;

show_debug_message(last_x_offset, last_y_offset);

var _interactable_instance = collision_line(x, y, x + _x_offset, y + _y_offset, obj_trigger_interactable, false, true);
if(can_interact() && _interactable_instance && check_confirm_pressed()) {
	with(_interactable_instance){event_user(0);};
}
#endregion