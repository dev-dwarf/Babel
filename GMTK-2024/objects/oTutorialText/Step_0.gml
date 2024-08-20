if (global.pause && !red) {
	red = true;	
	text = "Grant him access!"
}

if (red && !global.pause) {
	x = lerp(x, -320, 0.2);	
}

y = ystart + 3*sin(current_time*0.0025);