#!/bin/bash
cd /Paddle/demo/mnist
pip install /usr/opt/paddle/share/wheels/*.whl
bash data/get_mnist_data.sh
bash train.sh
