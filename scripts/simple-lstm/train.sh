#!/bin/bash

OpenNMT_py=../../OpenNMT-py
size=large #Can be: small OR large
type=unique #Can be: repetition OR unique
output_dir=../../saved_models/simple-lstm/$type/$size

export CUDA_VISIBLE_DEVICES=0,1,2,3
python $OpenNMT_py/train.py -data $output_dir/final -world_size 4 -gpu_ranks 0 1 2 3 -encoder_type brnn -enc_layers 2 -decoder_type rnn -dec_layers 2 -rnn_size 256 -global_attention general -batch_size 32 -word_vec_size 256 -bridge -copy_attn -reuse_copy_attn -train_steps 20000 -save_checkpoint_steps 5000 -valid_steps 1000 -save_model $output_dir/final-model