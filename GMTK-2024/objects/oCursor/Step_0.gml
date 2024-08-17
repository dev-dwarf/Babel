x = mouse_x;
y = mouse_y;

if (instance_exists(oPlace))
{
	with oPlace
	{
		x = other.x;
		y = other.y;
		move_snap(16,16);
		other.placex = x;
		other.placey = y;
		
		if (mouse_check_button(mb_right))
		{
			if (place_meeting(x,y,oWall))
			{
				var killmedaddy = instance_place(x,y,oWall);
				instance_destroy(killmedaddy);
			}
		}
		
	}
}

if (mouse_check_button(mb_left))
{
	with instance_create_depth(placex-16,placey-16,depth+1,oWall)
	{
		move_snap(16,16);
	}
}