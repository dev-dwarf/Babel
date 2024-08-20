
if (mouse_lock) {
	if (abs(lock_mousex - mouse_x) > 3 or abs(lock_mousey - mouse_y) > 3) {
		mouse_lock = false;
		mouse_speed = 0;
	}
} else {
	mouse_speed = lerp(mouse_speed, 32, 0.05);
	mousex = approach(mousex, mouse_x, mouse_speed);
	mousey = approach(mousey, mouse_y, mouse_speed);
	
	lock_mousex = 0;
	lock_mousey = 0;
}

if (global.pause) {
	spd = approach(spd, 0.25, 0.01);
	
	wallx = floor(mousex/16)*16;
	wally = floor(mousey/16)*16;

	if (cursor_i >= 0) {
		offsetx = oGame.blocks[cursor_i].sprite_width/2;
		offsety = oGame.blocks[cursor_i].sprite_height/2;
		
		outline_index = (oGame.blocks[cursor_i].sprite_width > 16) + 2*(oGame.blocks[cursor_i].sprite_height > 16)
	}

	var placex = offsetx + wallx;
	var placey = offsety + wally;
	
	handx = lerp(handx, placex, 2*spd);
	handy = lerp(handy, placey, 2*spd);
	
	x = lerp(x, placex, spd);
	y = lerp(y, placey, spd);
	
	can_place = !demon_guy && cursor_i >= 0 && !place_meeting(wallx,wally,oMakesPlace) && oGame.block_counts[cursor_i] > 0
	if (mouse_check_button_pressed(mb_left)) {
		if (cursor_i < 0) {
			var wall = instance_place(wallx,wally,oMakesPlace);
			if (wall && wall.red) {
				cursor_index = wall.image_index;
				cursor_i = wall.i;
				instance_destroy(wall);
				play_sound(Remove_Block, 1, false, 0.8, 0.1, 0.5);
			}	
		} else if can_place {
			with (instance_create_depth(wallx,wally, 0, oGame.blocks[cursor_i].object_index)) {
				image_index = other.cursor_index;	
				i = other.cursor_i;
				
				var wa = id;
				
				with instance_create_depth(x,y,-2,oPlace) {
					image_index = (wa.sprite_width > 16) + 2*(wa.sprite_height > 16);
					id.wall = wa;
					image_speed = 0;
				}
			}
			
			--oGame.block_counts[cursor_i];
			cursor_i = -1; 

			oCamera.screenshake += 2;
			
			play_sound(Place_Block, 1, false, 0.8, 0.1, 0.5);
		}
		
		if (chance(15)) {
			play_sound(Giggle, 4, false, 1.0, 0.1);
		}
	}
	
} else {
	// fuckoff offscreen
	spd = lerp(spd, 16, 0.2);
	x = approach(x, oPlayer.x - 640, spd);
	y = approach(y, oPlayer.y - 640, spd);
	
	wallx = lerp(wallx, x, 0.2);
	wally = lerp(wally, y, 0.2);
	
	handx = lerp(handx, x, 0.2);
	handy = lerp(handy, y, 0.2);
}

sprite_index = sCursor;

if (cursor_i >= 0) {
	mask_index = oGame.blocks[cursor_i].sprite_index;
} else {
	mask_index = sWall_red;	
}

angle_speed = lerp(angle_speed, 0.2, 0.1);
if (abs(target_cursor_angle - cursor_angle) < 0.2) {
	angle_speed = 0;
	cursor_angle = target_cursor_angle;
}
cursor_angle = lerp(cursor_angle, target_cursor_angle, angle_speed);	

if (global.pause) {
	if (floor(image_index) == 2 && floor(last_image_index) != floor(image_index)) {
		play_sound(choose(Flap_01, Flap_02, Flap_03), 5, false, 1.0, 0.1, 0.25);
	}
	
	
	
}