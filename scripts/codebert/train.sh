#!/bin/bash

lr=5e-5
batch_size=8
beam_size=5
source_length=510
target_length=510
train_steps=50000
eval_steps=1000
size=small  # Can be: small OR large
type=unique  # Can be: repetition OR unique
data_dir=./data/$type/split/$size
output_dir=saved_models/codebert/$type/$size
train_file=$data_dir/src-train.txt,$data_dir/tgt-train.txt
validate_file=$data_dir/src-val.txt,$data_dir/tgt-val.txt
pretrained_model=./codebert-base  # CodeBert model path downloaded from Huggingface
CodeBERT=./codebert


python $CodeBERT/run.py \
--do_train \
--do_eval \
--model_type roberta \
--model_name_or_path $pretrained_model \
--tokenizer_name roberta-base \
--train_filename $train_file \
--dev_filename $validate_file \
--output_dir $output_dir \
--max_source_length $source_length \
--max_target_length $target_length \
--beam_size $beam_size \
--train_batch_size $batch_size \
--eval_batch_size $batch_size \
--learning_rate $lr \
--train_steps $train_steps \
--eval_steps $eval_steps
