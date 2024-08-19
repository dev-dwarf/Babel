hsp = 0;
vsp = 0;
lastvsp = vsp;

spd = 0;
maxspd = 1.5;
accel = 0.1;

grv = 0.2;
jumpheight = -4;
walkdir = 1;
jump = false;

stamina_speed = 0;
max_stamina = 100;
x = xstart;
y = ystart;

reset = false;
grounded = true;

stamina = max_stamina;

enum player {
	reset,
	normal,
	ladder,
	fall,
	dead,
}
state = player.normal;

death_time_max = 20;
death_time = death_time_max;

ladder = noone;
footsteps = false;