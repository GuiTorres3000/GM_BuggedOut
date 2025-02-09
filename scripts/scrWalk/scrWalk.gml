// @function
function scrWalk(rightKey, leftKey, downKey, upKey, spd, maxspd, moveDir, moveBoth){
	
	moveDir = point_direction(0, 0, (rightKey - leftKey), (downKey - upKey));
	moveBoth = (rightKey - leftKey != 0) || (downKey - upKey != 0);
	
	spd = lerp(spd, maxspd, 0.25);
	
	xspd = lengthdir_x(spd * moveBoth, moveDir);
	yspd = lengthdir_y(spd * moveBoth, moveDir);
	
	return [moveDir, moveBoth, spd];
}