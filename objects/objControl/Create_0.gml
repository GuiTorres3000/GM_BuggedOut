global.pause = 0;
global.instCamera = view_camera[0];
#macro TS 16
#macro tagDepth "depthMain"

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