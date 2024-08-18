if (reset) {
	vsp = 0;
	hsp = 0;
	x = lerp(x, xstart, 0.2);
	y = lerp(y, ystart, 0.2);
	x = approach(x, xstart, 1);
	y = approach(y, ystart, 1);
	stamina = lerp(stamina, max_stamina, 0.25);
	walkdir = 1;

	if (x == xstart && y == ystart) {
		reset = false;
		event_user(0);
	}
} else if (!global.pause) {
	vsp = approach(vsp, 10, grv);
	
	spd = approach(spd, maxspd*stamina/max_stamina, accel);
	hsp = walkdir*spd;

	if (place_meeting(x,y+1,oWall)) {
		if (!grounded) {
			with instance_create_depth(x,y,depth+1,oFx) {
				sprite_index = sFxLand;	
			}
			spd *= 0.3;
			stamina -= 2*vsp;
		}
		
		grounded = true;
	} else {
		grounded = false;	
	}

	if (!jump && grounded) {
		var steppingon = place_meeting(x + 2*sign(hsp), y+1,oWall);
		var below = place_meeting(x + 2*sign(hsp), y+17, oWall);
	
		if (!steppingon) {
			if (!below && stamina > 25) {
				stamina -= 25;
				stamina_speed = 0;
				jump = true;
			} else {
				hsp *= 0.5;
			}
		}
	}
	
	//Jump
	stamina_speed = approach(stamina_speed, .4, 0.01);
	if (grounded) stamina += stamina_speed;
	stamina = clamp(stamina,0,100);
	if (jump) {
		jump = false;
		vsp = jumpheight;
		
		with instance_create_depth(x,y,depth+1,oFx) {
			sprite_index = sFxJump;	
		}
	}

	if (place_meeting(x+hsp,y,oWall)) {
		if (!place_meeting(round(x)+sign(hsp),y,oWall)) {
			x = round(x) + sign(hsp);
		}
		
		if (grounded) {
			if (place_meeting(x+hsp,y,oWall) && !place_meeting(x+hsp, y-16, oWall) && stamina > 10) {
				vsp = 0.66*jumpheight;
				stamina -= 10;
				stamina_speed = 0;
			} else {
				walkdir = -walkdir;
			}
		}
		
		spd = 0;
		hsp = 0;
	}
	x = x + hsp;

	if (place_meeting(x,y+vsp,oWall)) {
		if (!place_meeting(x,round(y)+sign(vsp),oWall)) {
			y = round(y) + sign(vsp);
		}
	
		vsp = 0;
	}
	y = y + vsp;

	if (y > room_height + sprite_height) {
		reset = true;	
	}
	
} else {
	reset = true;
}

