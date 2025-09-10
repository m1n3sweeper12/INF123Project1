if(room == cutscene) {
	if(layer_sequence_is_finished(sequence)) {
		layer_sequence_destroy(sequence);
		room_goto_next();
	}
}