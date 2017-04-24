#!/bin/bash
set -xe

export DISABLE_PLOT=True

apt-get install patch 
find /usr/ -name '*paddle-*whl' | xargs pip install

cd /book
patch -p0 </reg_test/test.patch

pip install notedown
pip install pillow

#01.fit_a_line
file=/book/01.fit_a_line/README.md
notedown ${file} --run --render > ${file%.*}.ipynb
file=/book/01.fit_a_line/README.en.md
notedown ${file} --run --render > ${file%.*}.ipynb

#02.recognize_digits
file=/book/02.recognize_digits/README.md
notedown ${file}  --run --render --timeout=1800 > ${file%.*}.ipynb
file=/book/02.recognize_digits/README.en.md
notedown ${file}  --run --render --timeout=1800 > ${file%.*}.ipynb
