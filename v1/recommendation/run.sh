#!/bin/bash
cd /Paddle/demo/recommendation
pip install /usr/opt/paddle/share/wheels/*.whl
bash data/ml_data.sh
bash preprocess.sh
python trainer_config.py
