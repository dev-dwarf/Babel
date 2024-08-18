
x = xstart + lerp(0.5*sprite_width, 0, image_xscale);
y = ystart + lerp(0.5*sprite_height, 0, image_yscale);

image_xscale = lerp(image_xscale, 1, 0.25);
image_yscale = lerp(image_yscale, 1, 0.25);
