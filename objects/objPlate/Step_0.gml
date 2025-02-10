if place_meeting(x,y,objAlly){
	mode = 1;
	instance_deactivate_object(door);
	image_index = 1;
} else {
	mode = 0;
	instance_activate_object(door);
	image_index = 0;
}

if ( hud ){
	pos += keyboard_check_pressed(ord("D"))-keyboard_check_pressed(ord("A"));
	if pos > 3 pos = 0;
	if pos < 0 pos = 3;
	
	if keyboard_check_pressed(ord("X")){
		hudBugs[pos].target = self;
		hudBugs[pos].rangeX = 8;
		hudBugs[pos].rangeY = 8;
		global.pause = false;
		hud = 0;
	}
}
