#!/bin/bash

OpenNMT_py=../../OpenNMT-py
size=large #Can be: small OR large
type=unique #Can be: repetition OR unique
data_path=../../data/$type/split/$size
output_dir=../../saved_models/simple-lstm/$type/$size

python $OpenNMT_py/translate.py -model $output_dir/final-model_step_20000.pt -src $data_path/src-test.txt -beam_size 5 -n_best 1 -output $output_dir/pred-test_beam5.txt -dynamic_dict