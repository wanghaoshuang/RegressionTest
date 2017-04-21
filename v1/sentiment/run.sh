#!/bin/bash
cd /Paddle/demo/sentiment
pip install /usr/opt/paddle/share/wheels/*.whl
apt-get install -y zip
bash data/get_imdb.sh
bash preprocess.sh
bash train.sh
