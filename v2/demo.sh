#!/bin/bash
set -xe

export DISABLE_PLOT=True

cd /book


array=()
while IFS=  read -r -d $'\0'; do
    array+=("$REPLY")
done < <(find /reg_test -name test.patch -print0)

for file in "${array[@]}"; do
    patch -p0<file
done


/bin/bash /book/.tools/convert-markdown-into-ipynb-and-test.sh

function reg_test() {
  for i in $@; do
    jupyter nbconvert --to python i --stdout | python
  done
}

if [ "$1" ]; then
  if [ "1" = "$1" ]; then
    #01.fit_a_line
    reg_test /book/01.fit_a_line/README.ipynb /book/01.fit_a_line/README.en.ipynb
  elif [ "2" = "$1" ]; then
    #02.recognize_digits
    reg_test /book/02.recognize_digits/README.ipynb /book/02.recognize_digits/README.en.ipynb
  elif [ "3" = "$1" ]; then
    #03.image_classification
    reg_test /book/03.image_classification/README.ipynb /book/03.image_classification/README.en.ipynb
  else
    echo "Not implemented!"
  fi
fi
