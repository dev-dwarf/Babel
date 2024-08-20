event_inherited();

jump = false
red = global.pause;
i = -1;
image_speed = 0;
image_index = irandom(image_number);

var c = irandom(8)*5 + 215;
image_blend = make_color_rgb(c, c, c);