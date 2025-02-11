// Tente mover no eixo X
if (!place_meeting(x + xspd, y, objWall)) {
    x += xspd;
} else {
	// Se colidir, não mexa no eixo X
    xspd = 0;
}

// Tente mover no eixo Y
if (!place_meeting(x, y + yspd, objWall)) {
    y += yspd;
} else {
	// Se colidir, não mexa no eixo Y
    yspd = 0;
}

#region update recording
if (x != xprevious || y != yprevious){
	for (var m = 93; m > 0; m--) {
	    posX[m] = posX[m - 1]; 
	    posY[m] = posY[m - 1];
	}
	posX[0] = x; 
	posY[0] = y;
}
#endregion