//draw options
draw_set_font(fnMain);
draw_set_valign(0);
draw_set_halign(0);

optionScale[pos] = lerp(optionScale[pos],1.2,.2);

for(var op = 0; op < opLength; op++ ){
	var _c = c_white;
	if ( op != pos ) { optionScale[op] = lerp(optionScale[op],1,.2); }
	else { _c = c_yellow; }
	draw_text_transformed_color(x+btnBorder+1, y+btnBorder+opSpace*op+1, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(x+btnBorder-1, y+btnBorder+opSpace*op-1, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(x+btnBorder	 , y+btnBorder+opSpace*op+1, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(x+btnBorder+1, y+btnBorder+opSpace*op, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(x+btnBorder  , y+btnBorder+opSpace*op-1, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(x+btnBorder-1, y+btnBorder+opSpace*op, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(x+btnBorder-1, y+btnBorder+opSpace*op+1, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(x+btnBorder+1, y+btnBorder+opSpace*op-1, option[menuLevel,op],optionScale[op],optionScale[op],0,c_black,c_black,c_black,c_black,1);
	
	draw_text_transformed_color(x+btnBorder, y+btnBorder+opSpace*op, option[menuLevel,op],optionScale[op],optionScale[op],0,_c,_c,_c,_c,1);
}
	
if control {
	draw_sprite(sprControls,0,x,y+opSpace*2);
}