#!/bin/bash

batch_size=8
beam_size=5
source_length=510
target_length=510
size=small  # Can be: small OR large
type=unique  # Can be: repetition OR unique
data_dir=./data/$type/split/$size
output_dir=saved_models/codebert/$type/$size
validate_file=$data_dir/src-val.txt,$data_dir/tgt-val.txt
test_file=$data_dir/src-test.txt,$data_dir/tgt-test.txt
test_model=$output_dir/checkpoint-best-ppl/pytorch_model.bin
pretrained_model=./codebert-base  # CodeBert model path downloaded from Huggingface
CodeBERT=./codebert

python $CodeBERT/run.py \
--do_test \
--model_type roberta \
--model_name_or_path $pretrained_model \
--tokenizer_name roberta-base  \
--load_model_path $test_model \
--dev_filename $validate_file \
--test_filename $test_file \
--output_dir $output_dir \
--max_source_length $source_length \
--max_target_length $target_length \
--beam_size $beam_size \
--eval_batch_size $batch_size