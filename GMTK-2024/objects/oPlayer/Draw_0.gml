if (state != player.dead) or (state != player.reset)
{
	draw_self();

	draw_healthbar(x-8,y-24,x+8,y-22,stamina,c_black,c_green,c_green,0,true,false);
	
}