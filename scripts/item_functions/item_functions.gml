

// pick up items
function inv_add(_item){
	
	if (array_length(obj_inv.inv) < obj_inv.inv_max) {
		array_push(obj_inv.inv, _item);
	}
	
	
}



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
		/*if (obj_player.weap) {
			inv_add(obj_player.eq_weap)
		}
		obj_player.weap = true;
		obj_player.atk_amp = 1;
		obj_player.eq_weap = stick.name;

	*/}
	
	), 		
	
	bandage : new create_item("Bandage",
	"It's been used before...",
	function() {
		/*if (obj_player.armor) {
			inv_add(obj_player.eq_armor)
		}
		obj_player.armor = true;
		obj_player.def_amp = 1;
		obj_player.eq_armor = bandage.name;

	
	*/}
	),
	mons_candy : new create_item("Monster Candy",
	"It has a distinct licorice flavor.",
	function() {
		obj_player.cur_hp += 10;
		// remove item
		array_delete(obj_inv.inv, obj_inv.select_item, 1);
		inv_length = array_length(obj_inv.inv);
	}
	),
	toy_knife : new create_item("Toy Knife",
	"It’s made of plastic. Rare nowadays.",
	function() {
		/*if (obj_player.weap) {
			inv_add(obj_player.eq_weap)
		}
		obj_player.weap = true;
		obj_player.atk_amp = 2;
		obj_player.eq_weap = toy_knife.name;
	*/}
	),
	but_pie : new create_item("Butterscotch Pie",
	"A slice of butterscotch cinnamon pie.",
	function() {
		obj_player.cur_hp += 5;
		// remove item
		array_delete(obj_inv.inv, obj_inv.select_item, 1);
		inv_length = array_length(obj_inv.inv);
	}
	),
	spi_donut : new create_item("Spider Donut",
	"made with spiders in the dough.",
	function() {
		obj_player.cur_hp += 25;
		// remove item
		array_delete(obj_inv.inv, obj_inv.select_item, 1);
		inv_length = array_length(obj_inv.inv);
	}
	),
	spi_cider : new create_item("Spider Cider",
	"contains whole spiders.",
	function() {
		obj_player.cur_hp += 25;
		// remove item
		array_delete(obj_inv.inv, obj_inv.select_item, 1);
		inv_length = array_length(obj_inv.inv);
	}
	),
	snail_pie : new create_item("Snail Pie",
	"A slice of snail pie. It looks slimy.",
	function() {
		obj_player.cur_hp += 5;
		// remove item
		array_delete(obj_inv.inv, obj_inv.select_item, 1);
		inv_length = array_length(obj_inv.inv);
	}
	),
	dirt_bow : new create_item("Dirty Bow",
	"A bow that makes you more cute, so enemies are less willing to hurt you",
	function() {
		/*if (obj_player.armor) {
			inv_add(obj_player.eq_armor)
		}
		obj_player.armor = true;
		obj_player.def_amp = 3;
		obj_player.eq_armor = dirt_bow.name;
	*/}
	),
	ballet_shoe : new create_item("Ballet Shoes",
	"These shoes make you feel incredibly dangerous",
	function() {
		/*if (obj_player.weap) {
			inv_add(obj_player.eq_weap)
		}
		obj_player.weap = true;
		obj_player.atk_amp = 1;
		obj_player.eq_weap = ballet_shoe.name;
	*/}
	),
	old_tutu : new create_item("Old Tutu",
	"Finally, a protective piece of armor",
	function() {
		/*if (obj_player.armor) {
			inv_add(obj_player.eq_armor)
		}
		obj_player.armor = true;
		obj_player.def_amp = 5;
		obj_player.eq_armor = old_tutu.name;
	*/}
	),
	cinn_bun : new create_item("Cinnamon Bunny",
	"A cinnamon bun shaped like a bunny",
	function() {
		obj_player.cur_hp += 20;
		// remove item
		array_delete(obj_inv.inv, obj_inv.select_item, 1);
		inv_length = array_length(obj_inv.inv);
	}
	),
	
	
}