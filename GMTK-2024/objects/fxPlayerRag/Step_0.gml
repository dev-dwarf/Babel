vsp = vsp + grv;
y = y + vsp;

if (vsp > 0)
{
	image_yscale = 1;
}
else 
{
	image_yscale = -1;
}

if (y > room_height)
{
	instance_destroy(self);
}