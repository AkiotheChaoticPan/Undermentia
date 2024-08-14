global.menu_open = false
// this is for the sake of the menu working :/
global._e = 0;


w = 0;
h = 0;

op_border = 12;
op_space = 16;

pos = 0;

option[0] = "ITEM";
option[1] = "STAT";
option[2] = "CELL";


op_length = array_length(option);


// sfx
last_select = 0;

_up_k = keyboard_check_pressed(vk_up);
_down_k = keyboard_check_pressed(vk_down);
_accept = keyboard_check_pressed(vk_enter);