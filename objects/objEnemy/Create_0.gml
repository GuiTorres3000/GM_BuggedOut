randomize();
spd = 1;
path = path_add();
moveDelay = 60;
moveTimer = 60+irandom(30); 

range = 32;
xspd = 0;
yspd = 0;

playerX = 0;
playerY = 0;

nextX = 0;
nextY = 0;

sinTimer = 0;

angleMod = 135*choose(1,-1)*random_range(0.8,1.2);


// Life
maxhp = irandom_range(2, 5);
hp = maxhp;