#!/bin/bash
set -xe

#disable python plot figures
export DISABLE_PLOT=True

#patch book v2 demos
cd /book
# find /reg_test -name test.patch | xargs patch -p0
patch -p0 < /reg_test/02.recognize_digits/test.patch
#convert markdown to ipynb
bash /book/.tools/convert-markdown-into-ipynb-and-test.sh

function reg_test() {
  for i in $@; do
    jupyter nbconvert --to python i --stdout | python
  done
}

if [ "$1" ]; then
  if [ "1" = "$1" ]; then
    #01.fit_a_line
    find 01* -name "README*ipynb" | xargs reg_test
  elif [ "2" = "$1" ]; then
    #02.recognize_digits
    find 02* -name "README*ipynb" | xargs reg_test
  elif [ "3" = "$1" ]; then
    #03.image_classification
    find 03* -name "README*ipynb" | xargs reg_test
  else
    echo "Not implemented!"
  fi
fi
