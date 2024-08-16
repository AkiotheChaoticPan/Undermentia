global._connected_gamepad = 0;
function find_connected_gamepad() {
	for(var _i = 0; _i < gamepad_get_device_count(); _i++) {
		if(gamepad_is_connected(_i)) {
			_connected_gamepad = _i;
			break;
		}
	}
}

find_connected_gamepad();

function check_up_pressed() {
	return keyboard_check(vk_up) || (gamepad_axis_value(global._connected_gamepad, gp_axislv) > 0);
}

function check_down_pressed() {
	return keyboard_check(vk_down) || (gamepad_axis_value(global._connected_gamepad, gp_axislv) < 0);
}

function check_left_pressed() {
	return keyboard_check(vk_left) || (gamepad_axis_value(global._connected_gamepad, gp_axislh) < 0);
}

function check_right_pressed() {
	return keyboard_check(vk_right) || (gamepad_axis_value(global._connected_gamepad, gp_axislh) > 0);
}

function check_confirm_pressed() {
	return keyboard_check_pressed(ord("Z")) || keyboard_check(vk_enter) || gamepad_button_check_pressed(global._connected_gamepad, gp_face1);
}

function check_return_pressed() {
	return keyboard_check_pressed(ord("X")) || keyboard_check(vk_shift) || gamepad_button_check_pressed(global._connected_gamepad, gp_face2);
}

function check_menu_pressed() {
	return keyboard_check_pressed(ord("C")) || keyboard_check(vk_control) || gamepad_button_check_pressed(global._connected_gamepad, gp_face3);
}