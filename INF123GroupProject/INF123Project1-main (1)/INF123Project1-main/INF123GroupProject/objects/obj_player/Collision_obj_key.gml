// lets player collect the key
effect_create_above(ef_spark, x, y, 1, c_ltgrey);
instance_destroy(obj_key);
has_key = true;