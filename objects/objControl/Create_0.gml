global.pause = -1;
global.instCamera	= objCam;
global.music		= 1;
#macro TS 16
#macro tagDepth "depthMain"
music = 0;
pause = -1;

asset_add_tags(objPlayer,tagDepth,asset_object);
asset_add_tags(objAlly,tagDepth,asset_object);
asset_add_tags(objEnemy,tagDepth,asset_object);
asset_add_tags(objPlate,tagDepth,asset_object);
asset_add_tags(objDoor,tagDepth,asset_object);
asset_add_tags(objEnemyBullet,tagDepth,asset_object);

//depth
depthGrid = ds_grid_create(2,0);
depthArray = tag_get_asset_ids(tagDepth,asset_object);

for( var i = 0; i < array_length(depthArray); i ++ ){
	var _obj = depthArray[i];
	//visible init
	with(_obj){
		visible = false;
	}
	//visible all
	object_set_visible(_obj,false);
}

depthMain = function(){
	//aumenta DS grid
	var _length = array_length(depthArray)
	var _inst	= 0;
	
	for( var i = 0; i < _length; i ++ ){
		for( var k = 0; k < instance_number(depthArray[i]); k ++ ){
			_inst ++;
		}
	}
	
	ds_grid_resize(depthGrid,2,_inst);
	
	var gridPos = 0;
	for( var i = 0; i < _length; i ++ ){
		for( var k = 0; k < instance_number(depthArray[i]); k ++ ){
			var _instFind = instance_find(depthArray[i],k)
			depthGrid[# 0, gridPos] = _instFind.id;
			depthGrid[# 1, gridPos] = _instFind.y;
			gridPos++;
		}
	}
	ds_grid_sort(depthGrid,1,true);
	
	//draw instances
	for( var i = 0; i < ds_grid_height(depthGrid); i ++ ){
		var _instFind = depthGrid[# 0, i]
		with(_instFind){
			event_perform(ev_draw, 0);
		}
	}
}
	
upKey = keyboard_check_pressed(vk_up);
downKey = keyboard_check_pressed(vk_down);
enterKey = keyboard_check_pressed(vk_enter);
pauseKey = keyboard_check_pressed(vk_space);

width  = 96;
height = 104;

//position
xPos = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-width/2;
yPos = camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2-height/2;

btnBorder	= 8; 
opSpace		= 16;
opAngle		= 0;
opAlpha		= 1;

pos = 0;

spaceWave = 0;
spaceshipX = 208;
spaceshipY = 16;
earthX = 144;
earthY = 112;

//Main menu
option[0, 0] = "Resume";
option[0, 1] = "Settings";
option[0, 2] = "Menu";

//Death
option[1, 0] = "Try again";
option[1, 1] = "Settings";
option[1, 2] = "Menu";

//Pause
option[2, 0] = "Controls";
option[2, 1] = "Back";

option[3, 0] = "Back"

control = false;

for(var i = 0; i < 3; i ++){
	optionScale[i] = 1;
}


iniMenulevel = 0;
menuLevel = 0;
opLength = 0;

_windowSetSize = function(_width,_height){
	window_set_size(_width, _height);
	surface_resize(application_surface, _width, _height);
}