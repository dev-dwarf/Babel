if (global.pause) {
	if (keyboard_check_pressed(ord("R"))) {
		oPlayer.reset = true;
		with oWall {
			if (red) {
				instance_destroy();	
			}
		}
	}
}

var mark_places = false;
if (last_walls != instance_number(oWall)) {
	last_walls = approach(last_walls, instance_number(oWall), 0.5);
	mark_places = true;
}

if (keyboard_check_pressed(vk_space) && global.pause = false) {
	global.pause = true;
	image_index = 0;
	
	oCursor.spd = 0.3;
	mark_places = true;
	
} else if (keyboard_check_pressed(vk_space) && global.pause = true) {
	global.pause = false;
	image_index = 1;

	// remove places	
	instance_destroy(oPlace);
}

// mark places
if (mark_places) {
	instance_destroy(oPlace);
	
	with oMakesPlace {
		for (var i = 0; i < sprite_width-1; i += 16) {
			instance_create_depth(x+i,y-16,depth,oPlace);
		}
	}
	
	with oMakesPlace {
		if (red && !place_meeting(x,y+1,oMakesPlace)) {
			instance_destroy();	
		}
	}
	
	with oScaffold {
		for (var i = 0; i < sprite_width-1; i += 16) {
			for (var j = 0; j < sprite_height-1; j += 16) {
				instance_create_depth(x+i,y+j,depth,oPlace);
			}
		}	
	}
}