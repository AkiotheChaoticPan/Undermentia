/// @description Cutscene actions

if timer >= 0 {
	timer += 1
	
	// actual cutscene stuff is here, use timer for timing stuff
	switch cutscene_id {
		
		// test cutscene
		case -1: {
			if timer == 1 {
				with (obj_npc) {
					if in_room_id != 0 { continue; }
					get_animation("playerdown")
					vspeed = 2
				}
			}
			if timer == 90 {
				with (obj_npc) {
					if in_room_id != 0 { continue; }
					get_animation("playerup")
					vspeed = 0
				}
			}
			if timer == 180 {
				with (obj_npc) {
					if in_room_id != 0 { continue; }
					sprite_index = spr_savelocation
					get_animation("savepoint")
					vspeed = -1
				}
				// resuming player movement
				// DO NOT FORGET TO DO THIS
				obj_player.in_cutscene = false
			}
		}
		
		
	}
}
