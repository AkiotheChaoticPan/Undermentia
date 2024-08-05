/// @description Waits for a while to execute the rest

room_goto(target_room);
obj_player.x = target_x;
obj_player.y = target_y;
instance_create_depth(0, 0, -9999, obj_fadeout);
recently_triggered = false;