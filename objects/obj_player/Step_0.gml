/// @description

var _delta = delta_time / 1000000;
var _move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var _move_y = keyboard_check(vk_down) - keyboard_check(vk_up);

var _new_x = x + (_move_x * movement_speed * _delta);
var _new_y = y + (_move_y * movement_speed * _delta);


// stops player from moving when menu is open
if (global.menu_open) {
	is_moving = false;
	return;
}

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