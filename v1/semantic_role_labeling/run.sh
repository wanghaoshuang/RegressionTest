#!/bin/bash
set -e
cd /Paddle/demo/semantic_role_labeling/data
bash get_data.sh
cd ..
bash train.sh
