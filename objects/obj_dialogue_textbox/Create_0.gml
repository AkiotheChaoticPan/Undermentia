/// @description Setup parameters
depth = -9998;
option = 0;
txt_timer = 0;
txt_wait_time = 15;
background_width = 480;
background_height = 96;
image_xscale = background_width / 32;
image_yscale = background_height / 32;
pos_x = 320;
pos_y = 288;
margin_x = 10;
margin_y = 8;
line_separation = 20;
text_speed = 0.7;
font = fnt_testfont;
next = undefined;
item = undefined;
play = undefined;
sound = undefined;
loop = undefined;
options = [undefined, undefined];
auto = false;
voice = sfx_talk_def;
colors[0] = {
	col : #ffffff,
	start : 0,
	end_pos : 999
};
color_char[0] = #ffffff;

effects[0] = {
	effect : "",
	start : 0,
	end_pos : 0
};
effect_char[0] = [];
effect_char_params[0] = [];

text_index = 0;
text = "* If you're reading this, something went wrong. Please reset your game.";
text_lenght = 0;
chars[0] = "";
char_x[0] = 0;
char_y[0] = 0;
character = undefined;
emotion = 0;
line_break[0] = 999;
break_num = 0;
break_offset = 0;
last_free_space = 0;
setup = false;

snd_delay = 3;
snd_count = snd_delay;