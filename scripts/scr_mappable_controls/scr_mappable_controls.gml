global._connected_gamepad = 0;
_prev_value_x = 0;
_prev_value_y = 0;

function find_connected_gamepad() {
	for(var _i = 0; _i < gamepad_get_device_count(); _i++) {
		if(gamepad_is_connected(_i)) {
			global._connected_gamepad = _i;
			break;
		}
	}
}

find_connected_gamepad();
gamepad_set_axis_deadzone(global._connected_gamepad, 0.1);

#region Holding
function check_up() {
	return keyboard_check(vk_up) || (gamepad_axis_value(global._connected_gamepad, gp_axislv) < 0);
}

function check_down() {
	return keyboard_check(vk_down) || (gamepad_axis_value(global._connected_gamepad, gp_axislv) > 0);
}

function check_left() {
	return keyboard_check(vk_left) || (gamepad_axis_value(global._connected_gamepad, gp_axislh) < 0);
}

function check_right() {
	return keyboard_check(vk_right) || (gamepad_axis_value(global._connected_gamepad, gp_axislh) > 0);
}

function check_confirm() {
	return keyboard_check(ord("Z")) || keyboard_check(vk_enter) || gamepad_button_check(global._connected_gamepad, gp_face1);
}

function check_return() {
	return keyboard_check(ord("X")) || keyboard_check(vk_shift) || gamepad_button_check(global._connected_gamepad, gp_face2);
}

function check_menu() {
	return keyboard_check(ord("C")) || keyboard_check(vk_control) || gamepad_button_check(global._connected_gamepad, gp_face3);
}
#endregion

#region One-time pressing
function check_up_pressed() {
	_value = gamepad_axis_value(global._connected_gamepad, gp_axislv);
	_is_pressed = keyboard_check_pressed(vk_up) || (_value < 0 && _prev_value_y != value);
	_prev_value_y = _value;
	return _is_pressed;
}

function check_down_pressed() {
	_value = gamepad_axis_value(global._connected_gamepad, gp_axislv);
	_is_pressed = keyboard_check_pressed(vk_down) || (_value > 0 && _prev_value_y != value);
	_prev_value_y = _value;
	return _is_pressed;
}

function check_left_pressed() {
	_value = gamepad_axis_value(global._connected_gamepad, gp_axislh);
	_is_pressed = keyboard_check_pressed(vk_left) || (_value < 0 && _prev_value_x != value);
	_prev_value_x = _value;
	return _is_pressed;
}

function check_right_pressed() {
	_value = gamepad_axis_value(global._connected_gamepad, gp_axislh);
	_is_pressed = keyboard_check_pressed(vk_right) || (_value > 0 && _prev_value_x != value);
	_prev_value_x = _value;
	return _is_pressed;
}

function check_confirm_pressed() {
	return keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(global._connected_gamepad, gp_face1);
}

function check_return_pressed() {
	return keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(global._connected_gamepad, gp_face2);
}

function check_menu_pressed() {
	return keyboard_check_pressed(ord("C")) || keyboard_check_pressed(vk_control) || gamepad_button_check_pressed(global._connected_gamepad, gp_face3);
}
#endregion
