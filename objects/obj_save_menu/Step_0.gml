/// @description Insert description here
// You can write your code in this editor
var _right_key = check_right_pressed()
var _left_key = check_left_pressed()

var _confirm_key = check_confirm_pressed()

if (_right_key || _left_key) {
	pos = 1 - pos
}

if (_confirm_key) {
	if (pos == 0) {
		instance_destroy(id)
	}
}