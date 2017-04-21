#!/bin/bash
set -e
cd /Paddle/demo/image_classification/data
pip install pillow
bash download_cifar.sh
cd ..
bash preprocess.sh
bash train.sh
