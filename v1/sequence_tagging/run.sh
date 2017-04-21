#!/bin/bash
set -e
cd /Paddle/demo/sequence_tagging/
bash data/get_data.sh
bash train.sh
