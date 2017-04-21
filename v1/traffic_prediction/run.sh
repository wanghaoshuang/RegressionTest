#!/bin/bash
set -e
cd /Paddle/demo/traffic_prediction
bash data/get_data.sh
bash train.sh
