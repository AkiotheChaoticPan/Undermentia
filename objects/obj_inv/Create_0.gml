// creating inventory
inv = array_create(0);

last_select = 0;
select_item = -1;

inv_length = array_length(inv);
inv_border = 12;
inv_space = 16;

inv_max = 10;

pos = 0;

w = 0;
h = 0;


option[0] = "USE";
option[1] = "INFO";
option[2] = "DROP";

depth = -9999;

// this is for when an actual font is implemented
// global.font = font_add_sprite(sprite, index, proportional, spacing)
 pos = 0;

// item constructor 
function create_item(_name, _desc, _effect) constructor {
	
	name = _name;
	desc = _desc;
	effect = _effect;
	
}

// item creation
global.item_list = {	

	stick : new create_item("Stick", 
	"A stick that fell down the hole with you. Deals 1 damage.",
	function() {
		if (obj_player.weap) {
			obj_player.weap = false;
			obj_player.atk -= 1;
		}
		obj_player.atk += 1;
		obj_player.weap = true;
	}
	
	), 		
	
	bandage : new create_item("Bandage",
	"Gross...a used bandage...You put it on anyways? Heals 5HP",
	function() {
		obj_player.cur_hp += 5;
		// remove item
		array_delete(inv, select_item, 1);
		inv_length = array_length(inv);
	}
	),
	
}




