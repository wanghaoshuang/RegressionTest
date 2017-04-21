#!/bin/bash
cd /Paddle/demo/recommendation
pip install /usr/opt/paddle/share/wheels/*.whl
pip install -r requirements.txt
apt-get install zip
bash data/ml_data.sh
bash preprocess.sh
bash run.sh
