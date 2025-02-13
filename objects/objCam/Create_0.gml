
/// @desc Set Up Camera
cam = view_camera[0];
follow = objPlayer;

viewWHalf = camera_get_view_width(cam) * 0.5;
viewHHalf = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

shakeFrames = 0;
shakeStrenght = 0;
shake = 0;