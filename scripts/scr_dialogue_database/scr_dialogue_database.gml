global.dialogues = [
	{
		text : "Howdy! I'm Flowey. Flowey the Flower!//You're new to the underground, aren't cha?//Golly, you must be so confused.//Someone better teach you how things work around here.//I guess little old me will have to do.//Ready? Here we go!",
		font : fnt_default,
		txt_speed : 0.7,
		next : 1,
		item : undefined,
		play : false,
		sound : undefined,
		loop : undefined,
		characters : [spr_port_flour, spr_port_flour, spr_port_flour, spr_port_flour, spr_port_flour, spr_port_flour],
		emotions : [0, 1, 2, 3, 4, 5],
		option1 : undefined,
		option2 : undefined,
		auto : false,
		voices : [sfx_talk_flowey, sfx_talk_flowey, sfx_talk_flowey, sfx_talk_flowey, sfx_talk_flowey, sfx_talk_flowey],
		colors : [],
		effects : []
	},
	{
		text : "HOWDY! I'm Flowey! Flowey the Flower.//Teehee, I know what you did there.//You killed her.//And you regret it so you reset!//You think you can get away from me with anything you do?//You’ve gotta try harder than that buddy.",
		font : fnt_default,
		txt_speed : 0.7,
		next : 2,
		item : undefined,
		play : false,
		sound : undefined,
		loop : undefined,
		characters : [spr_port_flour, spr_port_flour, spr_port_flour, spr_port_flour, spr_port_flour, spr_port_flour],
		emotions : [0, 1, 2, 3, 4, 5],
		option1 : undefined,
		option2 : undefined,
		auto : false,
		voices : [sfx_talk_flowey, sfx_talk_flowey, sfx_talk_flowey, sfx_talk_flowey, sfx_talk_flowey, sfx_talk_flowey],
		colors : [],
		effects : []
	},
	{
		text : "Seriously?! I thought you were finally seeing things my way.//We could have had so much fun burning this world down together, then you chickened out.",
		font : fnt_default,
		txt_speed : 0.7,
		next : 3,
		item : undefined,
		play : false,
		sound : undefined,
		loop : undefined,
		characters : [spr_port_flour, spr_port_flour],
		emotions : [0, 1],
		option1 : undefined,
		option2 : undefined,
		auto : false,
		voices : [sfx_talk_flowey, sfx_talk_flowey],
		colors : [],
		effects : []
	},
	{
		text : "HOWDY! I'm Flowey! Flowey the Flower.//Huh? Why did you make me introduce myself?//Teehee, it’s rude to act like you don’t know me.//Someone ought to teach you how to use manners.",
		font : fnt_default,
		txt_speed : 0.7,
		next : 4,
		item : undefined,
		play : false,
		sound : undefined,
		loop : undefined,
		characters : [spr_port_flour, spr_port_flour, spr_port_flour, spr_port_flour],
		emotions : [0, 1, 2, 3],
		option1 : undefined,
		option2 : undefined,
		auto : false,
		voices : [sfx_talk_flowey, sfx_talk_flowey, sfx_talk_flowey, sfx_talk_flowey],
		colors : [],
		effects : []
	},
	{
		text : "Don’t you have anything better to do?",
		font : fnt_default,
		txt_speed : 0.7,
		next : undefined,
		item : undefined,
		play : false,
		sound : undefined,
		loop : undefined,
		characters : [spr_port_flour],
		emotions : [0],
		option1 : undefined,
		option2 : undefined,
		auto : false,
		voices : [sfx_talk_flowey],
		colors : [],
		effects : []
	}
];

/// @param dialogue_id
function get_dialogue(_dialogue_id){
	dia = global.dialogues[_dialogue_id];
	return dia;
}