# MSR2021-ProgramRepair

### Paper
You can find the paper here: https://arxiv.org/abs/2103.11626
### Data

**Note**: If you are facing issues regarding the LFS bandwidth, you can download the dataset from Zenodo: https://zenodo.org/record/6802730.

`data` folder contains multiple folders and files:

- `repetition` folder contains MSR datasets WITH <buggy code, fixed code> duplicate pairs
- `unique` folder contains MSR datasets WITHOUT <buggy code, fixed code> duplicate pairs
- `sstubs(Large|Small).json` files contain dataset in JSON format
- `sstubs(Large|Small)-(train|test|val).json` files contain dataset split in JSON format
- `split/(large|small)` folders contain dataset in text format (what the CodeBERT works with)

### Running CodeBERT Experiments
1. Clone the repository
    - `git lfs install` 
    - `git clone https://github.com/EhsanMashhadi/MSR2021-ProgramRepair.git`
2. Download the CodeBERT model
    - `cd MSR2021-ProgramRepair`
    - `git clone https://huggingface.co/microsoft/codebert-base`
    - use the downloaded model's directory path as `pretrained_model` variable in script files
3. Install dependencies
    - `pip install torch==1.4.0`
    - `pip install transformers==2.5.0`
4. Train the model with MSR data
    - `bash ./scripts/codebert/train.sh`
5. Evaluate the model
    - `bash ./scripts/codebert/test.sh`
        
### Running Simple LSTM Experiments
1. Install [OpenNMT-py](https://github.com/OpenNMT/OpenNMT-py)
    - `pip install OpenNMT-py==2.2.0`
    - If you face conflicts between pytorch and CUDA version, you can follow this [link](https://pytorch.org/get-started/locally/)
2. Preprocess the MSR data
    - `bash ./scripts/simple-lstm/build_vocab.sh`
3. Train the model
    - `bash ./scripts/simple-lstm/train.sh`
4. Evaluate the model
    - `bash ./scripts/simple-lstm/test.sh`

### Running Simple LSTM Experiments using the legacy version of OpenNMT-py
**(This is the original version used to run the simple LSTM experiments in the paper.)**

1. Install [OpenNMT-py legacy](https://github.com/OpenNMT/OpenNMT-py/tree/legacy)
    - `pip install OpenNMT-py==1.2.0`
2. Preprocess the MSR data
    - `bash ./scripts/simple-lstm/legacy/preprocess.sh`
3. Train the model
    - `bash ./scripts/simple-lstm/legacy/train.sh`
4. Evaluate the model
    - `bash ./scripts/simple-lstm/legacy/test.sh`

### How to run all experiments?
   - You can change the `size` and `type` variables value in script files to run different experiments (large | small, unique | repetition).

### Have trouble running on GPU?
1. Check the `CUDA` and `PyTorch` compatibility
2. Assign the correct values for `CUDA_VISIBLE_DEVICES`, `gpu_rank`, and `world_size` based on your GPU numbers in all scripts.
3. Run on GPU by removing the `gpu_rank`, and `world_size` options in all scripts.
