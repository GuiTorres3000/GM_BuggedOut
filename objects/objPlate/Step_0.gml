if ( mode ) {
	instance_deactivate_object(door);
	image_index = 1;
} else {
	instance_activate_object(door);
	image_index = 0;
}

if ( hud ){
	pos += keyboard_check_pressed(ord("D"))-keyboard_check_pressed(ord("A"));
	if pos > 3 pos = 0;
	if pos < 0 pos = 3;
	
	if keyboard_check_pressed(ord("Z")){
		with(hudBugs[pos]){
			x = other.x+8;
			y = other.y+8;
			locked = 1;
			show_message("locked")
		}
		global.pause = false;
		mode = 1;
		hud = 0;
	}
} else if place_meeting(x,y,objPlayer) {
	if keyboard_check_pressed(ord("Z")){
		hud = 1; global.pause = 1;
	}
}
