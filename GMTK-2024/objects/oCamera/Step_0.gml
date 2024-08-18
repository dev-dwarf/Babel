// calculate camera size, with zoom
var true_width = zoom*global.camera_width;
var true_height= zoom*global.camera_height;

zoom = lerp(zoom, target_zoom, zoom_lerp);

var view_x = x-true_width/2;
var view_y = y-true_height/2;

#region screenshake
if (screenshake > 0) {
	view_x += random_range(screenshake/2, screenshake)*choose(-1,1)*global.screenshake_intensity;
	view_y += random_range(screenshake/2, screenshake)*choose(-1,1)*global.screenshake_intensity;
	
	screenshake = approach(screenshake, 0, screenshake_decrease);
	
	if (screenshake > screenshake_curve_threshold) {
		screenshake *= screenshake_curve;	
	}
}
#endregion

camera_set_view_size(camera, true_width, true_height);
camera_set_view_pos(camera, view_x, view_y);
