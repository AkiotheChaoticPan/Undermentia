global.cell = false;
global.stats = false;
global.inv_open = false;

obj_cell.visible = false;
obj_stat.visible = false;

// creating inventory
inv = [];

last_select = 0;
select_item = -1;
select_op = 0;


inv_border = 12;
inv_space = 16;

inv_max = 10;

op_pos = false;
pos = 0;

w = 0;
h = 0;

// stuff for use, info, drop
sec_op = false;
sec_pos = 0;
a = false;

option[0] = "USE";
option[1] = "INFO";
option[2] = "DROP";

op_length = array_length(option);

depth = -9999;

// this is for when an actual font is implemented
// global.font = font_add_sprite(sprite, index, proportional, spacing)
 pos = 0;




