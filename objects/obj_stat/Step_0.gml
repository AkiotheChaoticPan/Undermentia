// keep items updated
option[0] = "\"" + obj_player.name + "\"";
option[1] = "LV " + string(obj_player.lv);
option[2] = "HP " + string(obj_player.cur_hp) + "/" + string(obj_player.max_hp);
option[3] = "AT " + string(obj_player.atk) + "(" + string(obj_player.atk_amp) + ")";
option[4] = "DF " + string(obj_player.def) + "(" + string(obj_player.def_amp) + ")";
option[5] = "WEAPON " + obj_player.eq_weap;
option[6] = "ARMOR " + obj_player.eq_armor;
option[7] = "GOLD " + string(obj_player.gold);