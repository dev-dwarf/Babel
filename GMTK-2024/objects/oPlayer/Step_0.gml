if (global.pause = false)
{
	vsp = vsp + grv;
	hsp = walkspd;

	grounded = place_meeting(x,y+1,oWall);

	if (grounded)
	{
		var steppingon = instance_place(x,y+1,oWall);
	
		if (steppingon.jump)
		{
			jump = true;
		}
	
	}

	move_wrap(true,false,1)

	if (place_meeting(x+hsp,y,oWall))
	{
		if (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		}
		walkspd = -walkspd;
		//jump = true;
	}

	x = x + hsp;

	if (place_meeting(x,y+vsp,oWall))
	{
		if (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
	
		vsp = 0;
	}

	y = y + vsp;

	//Jump
	stamina = clamp(stamina,0,100);
	if (grounded) stamina ++;
	//if (place_free(x+walkspd*2,y+1)) && (grounded) jump = true;
	if (jump) && (stamina > 25)
	{
		jump = false;
		vsp = jumpheight;
		stamina = stamina - 25;
	}
}
