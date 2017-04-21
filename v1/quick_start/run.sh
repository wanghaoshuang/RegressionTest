#!/bin/bash
cd /Paddle/demo/quick_start
pip install /usr/opt/paddle/share/wheels/*.whl
bash data/get_data.sh
bash train.sh
