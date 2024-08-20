
state = choose(goat.idle, goat.eat, goat.walk);
timer = irandom(45)+30;

enum goat {
	idle,
	eat,
	walk
}

spd = 0;
hsp = 0.2*choose(-1, 1)
image_xscale = choose(-1, 1);