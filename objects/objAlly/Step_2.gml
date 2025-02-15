var player = instance_find(objPlayer, 0); // Encontra a primeira instância de objPlayer
if (player != noone &&! locked) {
    x = player.posX[record]; 
    y = player.posY[record];
}

if ( x != xprevious || y != yprevious ){
	sprite_index = spriteWalk;
	spriteDir = lengthdir_x(1,point_direction(x,0,playerX,0))
} else {
	sprite_index = spriteIdle;
}

image_xscale = -spriteDir;