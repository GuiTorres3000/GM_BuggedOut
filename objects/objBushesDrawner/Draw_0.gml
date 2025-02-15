
surface_set_target(surfaceA) {
  draw_clear_alpha(#ffffff, 0);
  camera_apply(view_camera[0]);
  
  var layerid = layer_get_id("tlBushes");
  var map_id = layer_tilemap_get_id(layerid);
  draw_tilemap(map_id, 0, 0);
  surface_reset_target();
}

surface_set_target(surfaceB);
draw_clear_alpha(c_white, 0);

var uTime = shader_get_uniform(shWind, "Time");
var uSize = shader_get_uniform(shWind, "Size");
var uWave = shader_get_uniform(shWind, "Wave");

var vw = camera_get_view_width(view_camera[0]);
var vh = camera_get_view_height(view_camera[0]);


shader_set(shWind);
shader_set_uniform_f(uTime, current_time / 4000);
shader_set_uniform_f(uSize, vw, vh);
shader_set_uniform_f(uWave, 1, 1);

var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);

draw_surface(surfaceA, 0, 0);

shader_reset();
surface_reset_target();

draw_surface(surfaceB, vx, vy);