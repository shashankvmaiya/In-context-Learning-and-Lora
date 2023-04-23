#!/bin/bash

ARG_DEVICE=--device=${1:-'cpu'}

# Q1
python3 main.py --task run_ft --model bert-tiny,bert-med --dataset amazon --k 1,8,128 $ARG_DEVICE

# Q2
python3 main.py --task run_icl --model med,full --dataset babi --k 0,1,16 $ARG_DEVICE
python3 main.py --task run_icl --model med,full --dataset xsum --k 0,1,4 --prompt none,tldr,custom $ARG_DEVICE

# Q3
python3 main.py --task run_ft --model med --mode first,last,middle,lora4,lora16 --dataset xsum,babi --k 0,1,8,128 $ARG_DEVICE

# Q4
python3 main.py --task run_icl --model med --dataset babi --k 16 --repeats 5 $ARG_DEVICE
