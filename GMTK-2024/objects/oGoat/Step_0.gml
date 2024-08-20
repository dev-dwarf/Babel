
if (timer-- < 0) {
	if (state == goat.walk) {
		hsp *= -1;
	}
	
	if (state == goat.idle) {
		state = choose(goat.eat, goat.walk);
		timer = irandom_range(90, 120);
		
		if (chance(15)) {
			play_sound(choose(Goat_01, Goat_02, Goat_03, Goat_04, Goat_05), 5, false, 1.0, 0.1);
		}
	} else {
		state = goat.idle;
		timer = irandom_range(90, 120);
	}
spd = 0;
	
}

if (state == goat.walk) {
	image_xscale = -1*sign(hsp);
	
	spd = approach(spd, hsp, 0.01);
	x += spd;
}

switch state {
	case goat.idle: sprite_index = sGoat_Idle; break;
	case goat.eat: sprite_index = sGoat_Eat; break; 
	case goat.walk: sprite_index = sGoat_Walk; break;
}
