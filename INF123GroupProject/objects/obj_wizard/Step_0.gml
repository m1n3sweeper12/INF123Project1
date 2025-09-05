

// sprite bobbing
if(abs(yvel) >= 2) {
	y_dir *= -1;
}

yvel += (0.1*y_dir);