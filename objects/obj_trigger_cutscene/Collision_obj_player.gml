/// @description Activating cutscene
if ds_map_exists(global.progress, string_concat("flag", string(used_flag))) {
	if global.progress[? string_concat("flag", string(used_flag))] == false {
		if stops_player { obj_player.in_cutscene = true }
		timer = 0
		global.progress[? string_concat("flag", string(used_flag))] = true
	}
}