#!/bin/bash

size=small  # Can be: small OR large
type=unique  # Can be: repetition OR unique
data_path=./data/$type/split/$size
output_dir=./saved_models/simple-lstm/$type/$size

onmt_translate -model $output_dir/final-model_step_20000.pt -src $data_path/src-test.txt -beam_size 5 -n_best 1 -output $output_dir/pred-test_beam5.txt
