global.name = "";
global.lv = 0;
global.max_hp = 20;
global.cur_hp = 20;
global.gold = 0;
global.exp = 0;

w = 0;
h = 0;

op_border = 12;
op_space = 16;

stats[0] = global.name;
stats[1] = "LV   " + string(global.lv); 
stats[2] = "HP   " + string(global.cur_hp) + "/" + string(global.max_hp);
stats[3] = "G    " + string(global.gold);

op_length = array_length(stats);
