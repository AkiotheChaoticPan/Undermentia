global.cell = false;
global.stats = false;

obj_cell.visible = false;
obj_stat.visible = false;

// creating inventory
inv = array_create(0);

last_select = 0;
select_item = -1;
select_op = 0;

inv_length = array_length(inv);
inv_border = 12;
inv_space = 16;

inv_max = 10;

pos = 0;

w = 0;
h = 0;

// stuff for use, info, drop
sec_op = false;
sec_pos = 0;
a = false;

option[0] = "USE";
option[1] = "INFO";
option[2] = "DROP";

op_length = array_length(option);

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
	"Its bark is worse than its bite.",
	function() {
		if (obj_player.weap) {
			obj_player.weap = false;
			obj_player.atk -= 1;
		}
		else {	
			obj_player.atk += 1;
			obj_player.weap = true;
		}
	}
	
	), 		
	
	bandage : new create_item("Bandage",
	"It's been used before...",
	function() {
		obj_player.cur_hp += 5;
		// remove item
		array_delete(inv, select_item, 1);
		inv_length = array_length(inv);
	}
	),
	mons_candy : new create_item("Monster Candy",
	"It has a distinct licorice flavor.",
	function() {
		obj_player.cur_hp += 10;
		// remove item
		array_delete(inv, select_item, 1);
		inv_length = array_length(inv);
	}
	),
	toy_knife : new create_item("Toy Knife",
	"It’s made of plastic. Rare nowadays.",
	function() {
		if (obj_player.weap) {
			obj_player.weap = false;
			obj_player.atk -= 3;
		}
		else {
			obj_player.atk += 3;
			obj_player.weap = true;
		}
	}
	),
	but_pie : new create_item("Butterscotch Pie",
	"A slice of butterscotch cinnamon pie.",
	function() {
		obj_player.cur_hp += 5;
		// remove item
		array_delete(inv, select_item, 1);
		inv_length = array_length(inv);
	}
	),
	spi_donut : new create_item("Spider Donut",
	"made with spiders in the dough.",
	function() {
		obj_player.cur_hp += 25;
		// remove item
		array_delete(inv, select_item, 1);
		inv_length = array_length(inv);
	}
	),
	spi_cider : new create_item("Spider Cider",
	"contains whole spiders.",
	function() {
		obj_player.cur_hp += 25;
		// remove item
		array_delete(inv, select_item, 1);
		inv_length = array_length(inv);
	}
	),
	snail_pie : new create_item("Snail Pie",
	"A slice of snail pie. It looks slimy.",
	function() {
		obj_player.cur_hp += 5;
		// remove item
		array_delete(inv, select_item, 1);
		inv_length = array_length(inv);
	}
	),
	dirt_bow : new create_item("Dirty Bow",
	"A bow that makes you more cute, so enemies are less willing to hurt you",
	function() {
		if (obj_player.armor) {
			obj_player.armor = false;
			obj_player.def -= 3;
		}
		else {
			obj_player.def += 3;
			obj_player.armor = true;
		}
	}
	),
	ballet_shoe : new create_item("Ballet Shoes",
	"These shoes make you feel incredibly dangerous",
	function() {
		if (obj_player.weap) {
			obj_player.weap = false;
			obj_player.atk -= 5;
		}
		else {
			obj_player.atk += 5;
			obj_player.weap = true;
		}
	}
	),
	old_tutu : new create_item("Old Tutu",
	"Finally, a protective piece of armor",
	function() {
		if (obj_player.armor) {
			obj_player.armor = false;
			obj_player.def -= 3;
		}
		else {
			obj_player.def += 3;
			obj_player.armor = true;
		}
	}
	),
	cinn_bun : new create_item("Cinnamon Bunny",
	"A cinnamon bun shaped like a bunny",
	function() {
		obj_player.cur_hp += 20;
		// remove item
		array_delete(inv, select_item, 1);
		inv_length = array_length(inv);
	}
	),
	
	
}




