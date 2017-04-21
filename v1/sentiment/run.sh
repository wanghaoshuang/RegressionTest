#!/bin/bash
cd /Paddle/demo/sentiment
pip install /usr/opt/paddle/share/wheels/*.whl
apt-get install -y zip

cat >> ~/.bash_profile << EOF
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
EOF

bash data/get_imdb.sh
bash preprocess.sh
bash train.sh
