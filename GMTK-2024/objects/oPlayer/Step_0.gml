//Code
switch (state) {
	case player.reset: {
		vsp = 0;
		hsp = 0;
		x = lerp(x, xstart, 0.2);
		y = lerp(y, ystart, 0.2);
		x = approach(x, xstart, 1);
		y = approach(y, ystart, 1);
		stamina = lerp(stamina, max_stamina, 0.25);
		walkdir = 1;

		if (x == xstart && y == ystart) {
			state = player.normal;
			event_user(0);
		}
	} break;
	case player.normal: {
		vsp = approach(vsp, 10, grv);
	
		spd = approach(spd, maxspd*stamina/max_stamina, accel);
		hsp = walkdir*spd;

		if (place_meeting(x,y+1,oWall)) {
			if (!grounded) {
				with instance_create_depth(x,y,depth+1,oFx) {
					sprite_index = sFxLand;	
				}
				spd *= lerp(0.3, 0, clamp(abs(lastvsp)*0.1, 0, 1));
				stamina -= 2*lastvsp;
				
				oCamera.screenshake += abs(lastvsp)*0.15;
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
			
			oCamera.screenshake += 2;
		}
		
		var lad = instance_place(x,y,oLadder);
		if (grounded && lad) {
			state = player.ladder;
			ladder = lad;
			hsp = 0;
			vsp = 0;
		} else if (y > room_height + sprite_height) {
			state = player.dead;	
		}
		
		if (place_meeting(x,y,oSpike)) 
		{
					
			instance_create_depth(x,y,depth,fxPlayerRag);
			state = player.dead;	
		}
	} break;
	case player.ladder: {
		var ladderx = ladder.x+ladder.sprite_width/2;
		x = approach(x, ladderx, 2);
		
		if (x == ladderx) {
			vsp = approach(vsp, -1.5, 0.1);
		}
		
		if (!instance_place(x, y+vsp, oLadder)) {
			spd = 0;
			state = player.normal;	
			ladder = noone;
		}
		
		if (y < 0 - sprite_height) {
			room_goto_next();
		}	
	} break;
	case player.fall: {
		
	} break;
	case player.dead: {
		hsp = 0;
		vsp = 0;
		
		if (death_time == death_time_max) {
			oCamera.screenshake += 5;	
			oCamera.zoom = 0.9;
			//oCamera.x = x;
			//oCamera.y = y;
		}
		
		death_time--;
		if (death_time < 0) {
			state = player.reset;	
		}
	} break;
}
//Animation
switch (state) {
	case player.reset: {
		vsp = 0;
		hsp = 0;
		x = lerp(x, xstart, 0.2);
		y = lerp(y, ystart, 0.2);
		x = approach(x, xstart, 1);
		y = approach(y, ystart, 1);
		stamina = lerp(stamina, max_stamina, 0.25);
		walkdir = 1;

		if (x == xstart && y == ystart) {
			state = player.normal;
			event_user(0);
		}
	} break;
	case player.normal: {
		
		if (!grounded)
		{
			if (vsp > 0) sprite_index = sPlayer_JumpDown;
			else sprite_index = sPlayer_JumpUp;
		}
		else
		{
			sprite_index = sPlayer_Run;
		}
		
	} break;
	case player.ladder: {
		sprite_index = sPlayer_Ladder;
	} break;
	case player.fall: {
		
	} break;
	case player.dead: {

		sprite_index = sPlayer_Death;
	} break;
}

if (hsp != 0)
{
	image_xscale = sign(hsp);
}


if (global.pause) {
	state = player.reset;	
}


if (state != player.dead) {
	lastvsp = vsp;

	if (place_meeting(x+hsp,y,oWall)) {
		if (!place_meeting(round(x)+sign(hsp),y,oWall)) {
			x = round(x) + sign(hsp);
		}
		
		if (state == player.normal && grounded) {
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
}

