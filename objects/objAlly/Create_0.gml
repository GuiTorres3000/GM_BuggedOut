randomize();
spd = 1.1;
path = path_add();
moveDelay = 60;
moveTimer = 10;

xspd = 0;
yspd = 0;

spriteIdle = 0;
target  = objPlayer;
playerX = 0;
playerY = 0;

nextX = 0;
nextY = 0;

sinTimer = 0;

moveDir = 0;
locked = 0;
rangeX = lengthdir_x(16,moveDir);
rangeY = lengthdir_x(16,moveDir);

allyChar = 0;