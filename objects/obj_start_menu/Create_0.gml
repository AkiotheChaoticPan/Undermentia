if file_exists("Save.sav") {
	obj_globalmanager.load();
} else {
	name = "test"
	obj_globalmanager.load();
	ds_map_replace(global.player_data, "name", name);
}