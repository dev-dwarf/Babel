audio_sound_gain(BABEL_Loop, global.music_gain*(1.0 - global.pause), 100);
audio_sound_gain(BABEL_Loop_Quiet, global.music_gain*global.pause, 100);

if (global.pause) {
	if (keyboard_check_pressed(ord("R"))) {
		oPlayer.reset = true;
		with oWall {
			x = xstart;
			y = ystart;
		}
	}
}

var mark_places = false;
if (last_walls != instance_number(oMakesPlace)) {
	last_walls = approach(last_walls, instance_number(oMakesPlace), 0.5);
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

if (keyboard_check_pressed(vk_right)) {
	if (room != room_last) room_goto_next();
} else if (keyboard_check_pressed(vk_left)) {
	if (room != room_first) room_goto_previous();
}

// mark places
//if (mark_places) {
//	instance_destroy(oPlace);
	
//	with oMakesPlace {
//		for (var i = 0; i < sprite_width-1; i += 16) {
//			instance_create_depth(x+i,y-16,0,oPlace);
//		}
//	}
	
//	with oMakesPlace {
//		if (red && !inv && !place_meeting(x,y+1,oMakesPlace)) {
//			instance_destroy();	
//		}
//	}
	
//	with oScaffold {
//		for (var i = 0; i < sprite_width-1; i += 16) {
//			for (var j = 0; j < sprite_height-1; j += 16) {
//				instance_create_depth(x+i,y+j,0,oPlace);
//			}
//		}	
//	}
//}