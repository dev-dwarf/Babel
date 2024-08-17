vsp = vsp + grv;
hsp = walkspd;

grounded = place_meeting(x,y+1,oWall);

if (place_meeting(x+hsp,y,oWall))
{
	if (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	walkspd = -walkspd;
	jump = true;
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
if (!place_meeting(x+walkspd*2,y+1,oWall)) && (grounded) or (jump)
{
	jump = false;
	vsp = jumpheight;
}
