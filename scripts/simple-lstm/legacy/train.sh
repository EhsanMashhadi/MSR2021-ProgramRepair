#!/bin/bash

size=small  # Can be: small OR large
type=unique  # Can be: repetition OR unique
output_dir=./saved_models/simple-lstm-legacy/$type/$size

export CUDA_VISIBLE_DEVICES=0,1,2,3 # You may change it based on the GPU number, and also change `world_size` and `gpu_ranks` accordingly.
#You can also delete the `world_size` and `gpu_ranks` to run the scripts on CPU (It will take much longer)
onmt_train -data $output_dir/final -world_size 4 -gpu_ranks 0 1 2 3 -encoder_type brnn -enc_layers 2 -decoder_type rnn -dec_layers 2 -rnn_size 256 -global_attention general -batch_size 32 -word_vec_size 256 -bridge -copy_attn -reuse_copy_attn -train_steps 20000 -save_checkpoint_steps 5000 -valid_steps 1000 -save_model $output_dir/final-model