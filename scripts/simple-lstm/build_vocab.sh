#!/bin/bash

size=small  # Can be: small OR large
type=unique  # Can be: repetition OR unique
data_config=./scripts/simple-lstm/${type}_${size}_data.yaml
output_dir=./saved_models/simple-lstm/$type/$size

if [ ! -d $output_dir ]
then
    mkdir -p $output_dir
fi

onmt_build_vocab -config $data_config  -src_seq_length 510 -tgt_seq_length 510 -src_vocab_size 64000 -tgt_vocab_size 64000 -share_vocab -n_sample -1 -save_data $output_dir/final -src_vocab $output_dir/final.vocab
