
if (global.pause) {
	spd = approach(spd, 0.25, 0.01);
	x = lerp(x, mouse_x, spd);
	y = lerp(y, mouse_y, spd);

	placex = floor(mouse_x/16)*16;
	placey = floor(mouse_y/16)*16;

	if (mouse_check_button_pressed(mb_left)) {
		if (!place_meeting(mouse_x,mouse_y,oWall)) {
			with instance_create_depth(placex,placey,depth+1,oWall) {
				image_xscale = 0.0;
				image_yscale = 0.0;
			}
		
			target_cursor_angle += 90;
			oCamera.screenshake += 1;
		}
	}
	
	if (mouse_check_button_pressed(mb_right)) {
		if (place_meeting(mouse_x,mouse_y,oWall)) {
			var killmedaddy = instance_place(mouse_x,mouse_y,oWall);
			instance_destroy(killmedaddy);
			target_cursor_angle -= 90;
			oCamera.screenshake += 1;
		}	
	}
} else {
	// fuckoff offscreen
	spd = lerp(spd, 16, 0.2);
	x = approach(x, oPlayer.x - 360, spd);
	y = approach(y, oPlayer.y - 360, spd);
	
	placex = lerp(placex, x, 0.2);
	placey = lerp(placey, y, 0.2);
}

// TODO anims
sprite_index = sCursor;

mask_index = sCursor;

angle_speed = lerp(angle_speed, 0.2, 0.1);
if (abs(target_cursor_angle - cursor_angle) < 0.2) {
	angle_speed = 0;
	cursor_angle = target_cursor_angle;
}
cursor_angle = lerp(cursor_angle, target_cursor_angle, angle_speed);	