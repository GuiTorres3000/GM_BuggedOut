//get inputs
upKey		= keyboard_check_pressed(ord("W"));
downKey		= keyboard_check_pressed(ord("S"));
enterKey	= keyboard_check_pressed(vk_space);

//number_options
opLength = array_length(option[menuLevel]);

//move menu
pos += downKey - upKey;

//move loop
if ( pos >= opLength )	{ pos = 0; }
if ( pos < 0 )			{ pos = opLength-1; }

if ( enterKey &&! instance_exists(objFade) ) { 
	//audio_play_sound(sndOptions, 1, 0);
	var sml = menuLevel;
	
	switch(menuLevel){
	case 0:
		switch(pos){
			case 0: scrFadeIn(rmGame);	break // Start
			case 1: menuLevel = 1;		break // Settings
			case 2: game_end()			break // Quit
		}
		break
	case 1:
		switch(pos){
			case 0: menuLevel = 2;		break // Window Size
			case 1: global.music	= -global.music; break // mute music
			case 2: window_set_fullscreen(window_get_fullscreen()? 0: 1) break // Fullscreen
			case 3: control = true; menuLevel = 3; break // Controls
			case 4: menuLevel = 0;		break // Back
		}
	break
	case 2:
		switch(pos){
			case 0: _windowSetSize(1280,720); break
			case 1: _windowSetSize(1600,900); break
			case 2: _windowSetSize(1920,1080);	break
			case 3: _windowSetSize(2560,1440); break
			case 4: menuLevel = 1;		break //Back
		}
	break
	case 3:
		control = false; menuLevel = 1;
	break
	}
	if ( sml != menuLevel ) { pos = 0; }
	
	opLength = array_length(option[menuLevel]);
}