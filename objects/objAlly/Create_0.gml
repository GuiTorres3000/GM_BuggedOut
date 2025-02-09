//speed
spd  = 0.05;
xspd = 0;
yspd = 0;

//player position
playerX = 0;
playerY = 0;

//path
moveTimer = 0;
_player_angle = irandom(360);
moveTimerMax = irandom(60);
_path = path_add();
angleMod = irandom_range(85,95)*choose(1,-1);

allyChar = 0;