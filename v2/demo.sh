#!/bin/bash
set -xe

#disable python plot figures
export DISABLE_PLOT=True

cd /book

function reg_test() {
  for i in $@; do
    # patch demo No.i
    demo_dir=$(dirname $i)
    # patching demo
    patch -p0 < /reg_test/$demo_dir*/test.patch
    # convert markdown to ipynb
    bash /book/.tools/convert-markdown-into-ipynb-and-test.sh
    # execute ipython notebook
    jupyter nbconvert --to python ${i%.*}.ipynb --stdout | python
    # unpatching demo
    patch -p0 -R < /reg_test/$demo_dir*/test.patch
  done
}

if [ "$1" ]; then
  mds=$(find 0$1* -name "README*md" | xargs)
  if [ "$mds" ]; then
    reg_test $mds
  fi
fi
