function scrFadeIn(_room){
	instance_create_depth(0,0,-1,objFade,{mode : 1, img: 0, _room: _room});
}