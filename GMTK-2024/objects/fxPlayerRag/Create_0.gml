vsp = -6;
grv = 0.2;

if (y < room_height + sprite_height) {
	repeat (40)
	{
	
		with instance_create_depth(x,y,depth,oFx)
		{
			sprite_index = sFXBlood;
			speed = random_range(2,6);
			direction = random_range(0,360);
			gravity = 0.2;
		}
	
	}
}