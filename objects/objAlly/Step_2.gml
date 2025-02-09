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