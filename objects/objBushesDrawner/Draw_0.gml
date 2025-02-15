surface = undefined;
//draw
if (surface_exists(surface) == false) {
  surface = surface_create(320, 180);
}

surface_set_target(surface) {
  draw_clear_alpha(#ffffff, 0);
  camera_apply(view_camera[0]);
  
  var layerid = layer_get_id("tlBushes");
  var map_id = layer_tilemap_get_id(layerid);
  draw_tilemap(map_id, 0, 0);
  surface_reset_target();
}


var uTime = shader_get_uniform(shWind, "Time");
var uSize = shader_get_uniform(shWind, "Size");
var uWave = shader_get_uniform(shWind, "Wave");

var vw = camera_get_view_width(view_camera[0]);
var vh = camera_get_view_height(view_camera[0]);


shader_set(shWind);
shader_set_uniform_f(uTime, current_time / 1000); // Define o tempo em segundos
shader_set_uniform_f(uSize, vw, vh); // Define o tamanho do sprite
shader_set_uniform_f(uWave, 1, 1); // Define a frequência e amplitude da onda

var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);

draw_surface(surface, vx, vy);

shader_reset();