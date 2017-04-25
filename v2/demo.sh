#!/bin/bash
set -xe

export DISABLE_PLOT=True

apt-get install patch 
find /usr/ -name '*paddle-*whl' | xargs pip install

cd /book
patch -p0 </reg_test/test.patch

pip install notedown
pip install pillow

function reg_test() {
  for i in $@; do
    notedown --match=python $i > ${i%.*}.ipynb
    jupyter nbconvert --to python ${i%.*}.ipynb --stdout | python
  done
}

if [ "$1" ]; then
  if [ "1" = "$1" ]; then
    #01.fit_a_line
    reg_test /book/01.fit_a_line/README.md /book/01.fit_a_line/README.en.md
  elif [ "2" = "$1" ]; then
    #02.recognize_digits
    reg_test /book/02.recognize_digits/README.md /book/02.recognize_digits/README.en.md
  else
    echo "Not implemented!"
  fi
fi
