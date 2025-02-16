//get inputs
upKey = keyboard_check_pressed(ord("W"));
downKey = keyboard_check_pressed(ord("S"));
pauseKey = keyboard_check_pressed(vk_escape);
enterKey = keyboard_check_pressed(vk_space);

//number_options
opLength = array_length(option[menuLevel]);

//position
xPos = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-width/2;
yPos = camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2-height/2;

/*
if !global.music {
	audio_stop_sound(music);
	music = 0;
}

if ( global.music ){
	switch(room){
		case Room1:
		var iniMusic = sndMenu;
		break
		case Room2:
		var iniMusic = sndGame;
		break
		case Room3:
		var iniMusic = sndMenu;
		break
	}


	if ( iniMusic != music ) {
		audio_stop_sound(music)
		audio_play_sound(iniMusic,0,true);
		audio_sound_gain(iniMusic,0,0)
		music = iniMusic;
	}

	audio_sound_gain(iniMusic,1,10000)
}
*/

if ( pauseKey && room =! rmMenu) {
	global.pause = 1; pause = 1;
}

//move menu
pos += downKey - upKey;

//move loop
if ( pos >= opLength )	{ pos = 0; }
if ( pos < 0 )			{ pos = opLength-1; }

if ( global.pause && enterKey &&! instance_exists(objFade) && pause ) { 
	var sml = menuLevel;
	//audio_play_sound(sndOptions, 1, 0);
	
	switch(menuLevel){
	default:
		switch(pos){
			case 0: global.pause = -1;	pause = -1; break // resume
			case 1 : iniMenulevel = menuLevel; menuLevel = 2; break // Settings
			case 2 : global.pause = -1; pause = -1; scrFadeIn(rmMenu); break // menu
		}
		break
	case 1:
		switch(pos){
			case 0: scrFadeIn(room); global.pause = -1; pause = -1; 	break // Try again
			case 1 : iniMenulevel = menuLevel; menuLevel = 2; break // settings
			case 2 : global.pause = -1; pause = -1; scrFadeIn(Room1); break // Menu
		}
	break
	case 2:
		switch(pos){
			case 0 : control = true; menuLevel = 3;	break // Controls
			case 1 : menuLevel = iniMenulevel;	break // Back
		}
	break
	case 3:
		control = false; menuLevel = 2;
	break
	}
	if ( sml != menuLevel ) { pos = 0; }
	
	opLength = array_length(option[menuLevel]);
}