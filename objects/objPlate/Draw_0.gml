draw_self();
if place_meeting(x,y,objPlayer){
	draw_sprite(sprX,0,x,y-32)
}
if ( hud ){
	for(var i = 0; i < 4; i++){
		var _scale = 1;
		if i == pos _scale = 1.2;
		draw_sprite_ext(hudBugs[i].spriteIdle,0,x-24+32*i,y-32,_scale,_scale,0,c_white,1);
	}
}
