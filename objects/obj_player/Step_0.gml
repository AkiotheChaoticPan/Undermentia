/// @description Movement

var _delta = delta_time / 1000000;
var _move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var _move_y = keyboard_check(vk_down) - keyboard_check(vk_up);

x += (_move_x * movement_speed * _delta);
y += (_move_y * movement_speed * _delta);

if (_move_x != 0) {
	is_moving = true;
    dir = (_move_x > 0) ? DIRECTION.RIGHT : DIRECTION.LEFT;
    set_animation((_move_x > 0) ? "right" : "left");
} else if (_move_y != 0) {
	is_moving = true;
    dir = (_move_y > 0) ? DIRECTION.DOWN : DIRECTION.UP;
    set_animation((_move_y > 0) ? "down" : "up");
} else {
    is_moving = false;
	image_index = animation_frames[0];
}