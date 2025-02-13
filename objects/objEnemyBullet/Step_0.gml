if place_meeting(x,y,objPlayer){
	with(objPlayer){
		hp--;
	}
	instance_destroy();
	scrScreenshake(4,16);
}

speed = lerp(speed,0,.05);
if ( speed < .1 || place_meeting(x,y,objWall) ) instance_destroy();