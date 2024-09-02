/// @description

if (should_destroy) {
	global.player_interact = true
	instance_destroy(id)
}

var _right_key = check_right_pressed()
var _left_key = check_left_pressed()

var _confirm_key = check_confirm_pressed()

if (_right_key || _left_key) {
	pos = 1 - pos
}

if (_confirm_key) {
	if (pos == 0) {
		should_destroy = true // Destroy in next step to avoid save from retriggering
	}
}