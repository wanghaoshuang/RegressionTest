#!/bin/bash
set -e

export DISABLE_PLOT=True

apt-get install patch
find /usr/ -name '*paddle-*whl' | xargs pip install

cd /book && patch -p0 </reg_test/test.patch

bash .tools/convert-markdown-into-ipynb-and-test.sh

#01.fit_a_line
jupyter nbconvert --to python book/01.fit_a_line/README.ipynb --stdout | python
jupyter nbconvert --to python book/01.fit_a_line/README.en.ipynb --stdout | python

#02.recognize_digits
jupyter nbconvert --to python book/02.recognize_digits/README.ipynb --stdout | python
jupyter nbconvert --to python book/02.recognize_digits/README.en.ipynb --stdout | python
