#!/bin/bash
cd /Paddle/demo/mnist
pip install /usr/opt/paddle/share/wheels/*.whl
bash data/ml_data.sh
bash preprocess.sh
python trainer_config.py
