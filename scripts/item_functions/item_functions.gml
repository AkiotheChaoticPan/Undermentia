// pick up items
function inv_add(_item){
	
	if (array_length(obj_inv.inv) < obj_inv.inv_max) {
		array_push(obj_inv.inv, _item);
	}
	
	
}