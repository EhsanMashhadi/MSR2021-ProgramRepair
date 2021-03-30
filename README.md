# MSR2021-ProgramRepair

### Paper
You can find the paper here: https://arxiv.org/abs/2103.11626
### Data
data folder contains multiple folders and files:

- `repetition` folder contains MSR datasets WITH <buggy code, fixed code> duplicate pairs
- `unique` folder contains MSR datasets WITHOUT <buggy code, fixed code> duplicate pairs
- `sstubs(Large|Small).json` files contain dataset in JSON format
- `sstubs(Large|Small)-(train|test|val).json` files contain dataset split in JSON format
- `split/(large|small)` folders contain dataset in text format (what the CodeBERT works with)

### Running CodeBert Experiments
1. Download the CodeBERT model
    - git lfs install
    - git clone https://huggingface.co/microsoft/codebert-base
    - use current path as `pretrained_model` variable in script files
2. Clone the repository
    - git clone https://github.com/EhsanMashhadi/MSR2021-ProgramRepair.git
3. Train the model with MSR data
    - bash ./scripts/codebert/train.sh
4. Evaluate the model
    - bash ./scripts/codebert/test.sh 
        
### Running Simple LSTM Experiments
1. Install OpenNMT-py
    - https://github.com/OpenNMT/OpenNMT-py
2. Preprocess the MSR data
    - bash ./scripts/simple-lstm/preprocess.sh
3. Train the model
    - bash ./scripts/simple-lstm/train.sh
4. Evaluate the model
    - bash ./scripts/simple-lstm/test.sh

### How to run all of experiments?
   - You can change the `size` and `type` variables value in script files to run different experiments (large | small, unique | repetition)