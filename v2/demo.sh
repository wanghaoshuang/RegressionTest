#!/bin/bash
set -e

export DISABLE_PLOT=True

find /usr/ -name '*paddle-*whl' | xargs pip install

#01.fit_a_line
jupyter nbconvert --to python book/01.fit_a_line/README.ipynb --stdout | python
jupyter nbconvert --to python book/01.fit_a_line/README.en.ipynb --stdout | python

#02.recognize_digits
jupyter nbconvert --to python book/02.recognize_digits/README.ipynb --stdout | python
jupyter nbconvert --to python book/02.recognize_digits/README.en.ipynb --stdout | python
