#!/bin/bash

size=small  # Can be: small OR large
type=unique  # Can be: repetition OR unique
data_path=./data/$type/split/$size
output_dir=./saved_models/simple-lstm-legacy/$type/$size

if [ ! -d $output_dir ]
then
    mkdir -p $output_dir
fi

onmt_preprocess -train_src $data_path/src-train.txt -train_tgt $data_path/tgt-train.txt -valid_src $data_path/src-val.txt -valid_tgt $data_path/tgt-val.txt --src_seq_length 510 --tgt_seq_length 510 --src_vocab_size 64000 --tgt_vocab_size 64000 -dynamic_dict -share_vocab --save_data $output_dir/final