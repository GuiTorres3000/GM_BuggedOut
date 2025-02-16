width  = 96;
height = 104;

upKey		= keyboard_check_pressed(vk_up);
downKey		= keyboard_check_pressed(vk_down);
enterKey	= keyboard_check_pressed(vk_enter);

btnBorder	= 8; 
opSpace		= 16;
opAngle		= 0;
opAlpha		= 1;

pos = 0;

// Controles
upKey = 0;
downKey = 0;
enterKey = 0;

//Main menu
option[0, 0] = "Start";
option[0, 1] = "Settings";
option[0, 2] = "Quit";

//settings
option[1, 0] = "Window Size";
option[1, 1] = "Mute music";
option[1, 2] = "Fullscreen";
option[1, 3] = "Controls";
option[1, 4] = "Back";

//window Size
option[2, 0] = "1280x720";
option[2, 1] = "1600x900";
option[2, 2] = "1920x1080";
option[2, 3] = "2560x1440";
option[2, 4] = "Back";
option[3, 0] = "Back";

for(var i = 0; i < 5; i ++){
	optionScale[i] = 1;
}

control = false;

menuLevel = 0;
opLength = 0;

_windowSetSize = function(_width,_height){
	window_set_size(_width, _height);
	window_center();
	surface_resize(application_surface, _width, _height);
}