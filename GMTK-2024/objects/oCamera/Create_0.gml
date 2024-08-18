zoom = 0.9;
target_zoom = 1.0;
zoom_lerp = 0.1;

screenshake_decrease = 1.5;
screenshake_curve_threshold = 10;
screenshake_curve = 0.9;
screenshake = 0;

global.camera_width = 320;
global.camera_height = 320;
global.screenshake_intensity = 1.0;

// set up views 
x = room_width/2;
y = room_height/2;
camera = camera_create_view(x, y, global.camera_width, global.camera_height);

// display_set_gui_size(global.camera_width, global.camera_height);