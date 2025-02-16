if ( mode ) {
	img += imgVel;
	if ( img  - imgNum > cs + 1 ){
	instance_destroy();
	room_goto(_room);
	scrFadeOut();
	}
} 
else {
	img -= imgVel;
	if ( img  < -5 ){
	instance_destroy();
	}
}

//Lines
for(var _i = 0; _i < ls; _i++) {
	//Collums
	for(var _j = 0; _j < cs; _j++) { 
		
		var iImg = min(max(0,img-_j),imgNum)
		
		draw_sprite_ext(sprSquare, iImg, _j*scale, _i*scale,scale/16,scale/16,0,c_black,1) 
	}
}