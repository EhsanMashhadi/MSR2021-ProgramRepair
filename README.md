# MSR2021-ProgramRepair

### Data
data folder contains multiple folders and files:

- `repetition` folder contains MSR datasets WITH <buggy code, fixed code> duplicate pairs
- `unique` folder contains MSR datasets WITHOUT <buggy code, fixed code> duplicate pairs
- `sstubs(Large|Small).json` files contain dataset in JSON format
- `sstubs(Large|Small)-(train|test|val).json` files contain dataset split in JSON format
- `split/(large|small)` folders contain dataset in text format (what the CodeBERT works with)

###Running CodeBert Experiments
1. Download the CodeBERT model
    - git lfs install
    - git clone https://huggingface.co/microsoft/codebert-base
2. Train the model with MSR data
    - bash ./scripts/codebert-train.sh
    - You can change the `size` and `type` variable value to run different experiments
3. Evaluate the model
    - bash ./scripts/codebert-test.sh 
    - You can change the `size` and `type` variable value to run different experiments