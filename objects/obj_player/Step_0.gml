/// @description Movement

var _delta = delta_time / 1000000;
var _fi_movement_speed = movement_speed * _delta; // Frame-Independent Movement Speed

var _move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var _move_y = keyboard_check(vk_down) - keyboard_check(vk_up);

// Move
x = x + (_move_x * _fi_movement_speed);
y = y + (_move_y * _fi_movement_speed);
is_moving = (_move_x != 0 || _move_y != 0) ? true : false;

// Get Direction
if (_move_x > 0) dir = DIRECTION.RIGHT;
else if (_move_x < 0) dir = DIRECTION.LEFT;
if (_move_y > 0) dir = DIRECTION.DOWN;
else if (_move_y < 0) dir = DIRECTION.UP

show_debug_message(is_moving);