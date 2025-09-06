var num = random_range(fairy_min, fairy_max);

for(var i = 0; i < num; i++) {
	instance_create_layer(x, y, "Instances", obj_evil_fairy);
}

attacking = false;