#!/bin/bash
set -e
cd /Paddle/demo/seqToseq/data
bash wmt14_data.sh
cd ..
python preprocess.py -i data/wmt14 -d 30000
cd translation
bash train.sh
