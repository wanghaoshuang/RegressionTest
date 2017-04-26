#!/bin/bash
set -xe

#disable python plot figures
export DISABLE_PLOT=True

cd /book

function reg_test() {
  # patching demo
  patch -p0 < $2
  # convert markdown to ipynb
  bash /book/.tools/convert-markdown-into-ipynb-and-test.sh
  # execute ipython notebook
  jupyter nbconvert --to python ${1%.*}.ipynb --stdout | python
  # unpatching demo
  patch -p0 -R < $2
}

mds=$(find 0$1* -name "README*md" | xargs)
if [ "$mds" ]; then
  for i in $mds; do
    demo_dir=$(dirname $i)
    export PYTHONPATH=/book/$demo_dir:$PYTHONPATH
    if [ "0" == "$2"]; then
      patch=/reg_test/$demo_dir/test.patch
    else
      patch=/reg_test/$demo_dir/test.gpu.patch
    fi
    reg_test $i $patch
  done
fi
