//Code
image_speed = (global.pause)? 0 : 1;

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
	
		spd = approach(spd, maxspd, accel);
		hsp = walkdir*spd;

		if (place_meeting(x,y+.5,oWall)) {
			if (!grounded) {
				with instance_create_depth(x,y,depth+1,oFx) {
					sprite_index = sFxLand;	
				}
				spd *= lerp(0.3, 0, clamp(abs(lastvsp)*0.1, 0, 1));
				stamina -= 2*lastvsp;
				
				oCamera.screenshake += abs(lastvsp)*0.15;
				
				play_sound(choose(Landing_01, Landing_02, Landing_03),
					1, false, 1.0, 0.066, 1.0);
			}
		
			grounded = true;
		} else {
			grounded = false;	
		}

		if (!jump && grounded) {
			var steppingon = place_meeting(x + 3*sign(hsp), y+1,oWall);
	
			if (!steppingon) {
				if (stamina > 50) {
					stamina -= 50;
					stamina_speed = 0;
					jump = true;
				} else {
					hsp *= 0.5;
				}
			}
		}
	
		//Jump
		stamina_speed = approach(stamina_speed, 1, .1);
		if (grounded) stamina += stamina_speed;
		stamina = clamp(stamina,0,100);
		if (jump) {
			jump = false;
			vsp = jumpheight;
		
			with instance_create_depth(x,y,depth+1,oFx) {
				sprite_index = sFxJump;	
			}
			
			oCamera.screenshake += 2;
			
			play_sound(choose(Jump_01, Jump_02, Jump_03),
					1, false, 1.0, 0.066, 1.0);
		}
		
		var lad = instance_place(x,y,oLadder);
		if (grounded && lad) {
			state = player.ladder;
			ladder = lad;
			hsp = 0;
			vsp = 0;
		} else if (y > room_height + sprite_height) {
			instance_create_depth(x,y,depth,fxPlayerRag);
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

if (hsp != 0) && (state != player.ladder)
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
		
		if (state == player.normal) {
			if (grounded && place_meeting(x+hsp,y,oWall) && !place_meeting(x+hsp, y-16, oWall) && stamina > 10) {
				vsp = 0.66*jumpheight;
				stamina -= 10;
				stamina_speed = 0;
				
				play_sound(choose(Jump_01, Jump_02, Jump_03),
					1, false, 1.2, 0.066, 0.9);
			} else if (grounded || vsp >= 0.5) {
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
			
			if (floor(image_index = 1) or floor(image_index = 3))
			{
				with instance_create_depth(x,y,depth+1,oFx) {
				sprite_index = sFxWalk;	
				image_xscale = other.image_xscale;
				image_yscale = random_range(0.8,1.2);
				}
			}
			
		}
	} break;
	case player.ladder: {
		sprite_index = sPlayer_Ladder;
		image_xscale = 1;
	} break;
	case player.fall: {
		
	} break;
	case player.dead: {
		sprite_index = -1;
	} break;
}

if (image_index != last_image_index) {
	if (image_index == 0 || image_index == 2) {
		if (grounded) {	
			play_sound(choose(Footstep_1, Footstep_2, Footstep_3, Footstep_4, Footstep_5, Footstep_6, Footstep_7),
				5, false, 1.0, 0.03, 0.25);
		} else if (state == player.ladder) {
			play_sound(choose(Ladder_Climb_01, Ladder_Climb_02, Ladder_Climb_03, Ladder_Climb_04, Ladder_Climb_05),
				5, false, 1.0, 0.03, 0.25);
		}
	}
}
last_image_index = image_index;

