/// @description be removed on save reload dependent on flag

if appear_on_flag > 0 && not global.progress[? string_concat("flag", string(appear_on_flag))] {
	instance_destroy()
}
if disappear_on_flag > 0 && global.progress[? string_concat("flag", string(disappear_on_flag))] {
	instance_destroy()
}
