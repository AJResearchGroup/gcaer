#!/bin/bash
trainedmodeldir=/home/richel/.cache/gcaer/file1631a379ae28f/

# Run epoch 0-1
python3 ~/.local/share/GenoCAE/run_gcae.py train --datadir /home/richel/GitHubs/gcaer/inst/extdata/ --data gcae_input_files_1 --model_id M1 --resume_from 0 --epochs 1 --save_interval 1 --train_opts_id ex3 --data_opts_id b_0_4 --trainedmodeldir $trainedmodeldir --pheno_model_id p2

# Run epoch 1-2
python3 ~/.local/share/GenoCAE/run_gcae.py train --datadir /home/richel/GitHubs/gcaer/inst/extdata/ --data gcae_input_files_1 --model_id M1 --resume_from 1 --epochs 1 --save_interval 1 --train_opts_id ex3 --data_opts_id b_0_4 --trainedmodeldir $trainedmodeldir --pheno_model_id p2

