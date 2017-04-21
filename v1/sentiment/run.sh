#!/bin/bash
cd /Paddle/demo/sentiment
pip install /usr/opt/paddle/share/wheels/*.whl
apt-get install zip
bash data/get_imdb.sh
bash train.sh
