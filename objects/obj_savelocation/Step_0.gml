
if place_meeting(x, y, obj_player) && check_confirm_pressed() {
	if (!instance_exists(current_menu_id)) {
		current_menu_id = instance_create_layer(obj_player.x, obj_player.y - 20, "UI", obj_save_menu)
		global.player_interact = false
	}
}