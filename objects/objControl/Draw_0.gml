depthMain();

if ( global.pause && pause ) {
	draw_set_font(fnMain);
	draw_set_valign(0);
	draw_set_halign(0);
	
	//draw menu background
	draw_sprite_ext(sprite_index, image_index, xPos, yPos, width/sprite_width, height/sprite_height,opAngle,c_white,opAlpha);

	optionScale[pos] = lerp(optionScale[pos],1.2,.2);

	for(var op = 0; op < opLength; op++ ){
		var _c = c_white;
		if ( op != pos ) { optionScale[op] = lerp(optionScale[op],1,.2); }
		else { _c = c_yellow; }
		draw_text_transformed_color(xPos+btnBorder+1, yPos+btnBorder+opSpace*op+1, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
		draw_text_transformed_color(xPos+btnBorder-1, yPos+btnBorder+opSpace*op-1, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
		draw_text_transformed_color(xPos+btnBorder	, yPos+btnBorder+opSpace*op+1, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
		draw_text_transformed_color(xPos+btnBorder+1, yPos+btnBorder+opSpace*op, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
		draw_text_transformed_color(xPos+btnBorder  , yPos+btnBorder+opSpace*op-1, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
		draw_text_transformed_color(xPos+btnBorder-1, yPos+btnBorder+opSpace*op, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
		draw_text_transformed_color(xPos+btnBorder-1, yPos+btnBorder+opSpace*op+1, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
		draw_text_transformed_color(xPos+btnBorder+1, yPos+btnBorder+opSpace*op-1, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
	
		draw_text_transformed_color(xPos+btnBorder, yPos+btnBorder+opSpace*op, option[menuLevel,op],optionScale[op],optionScale[op],0,_c,_c,_c,_c,1);
	}
	
	if control {
		draw_sprite(sprControls,0,xPos,yPos+opSpace*2);
	}
}