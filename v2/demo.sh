#!/bin/bash
set -e

export DISABLE_PLOT=True

apt-get install patch
find /usr/ -name '*paddle-*whl' | xargs pip install

cd /book && patch -p0 </reg_test/test.patch

wget -c http://golangtc.com/static/go/1.8/go1.8.linux-amd64.tar.gz  | tar -C /usr/lib/ -xz && \
    mkdir -p /usr/share/go
export GOROOT=/usr/lib/go
export GOPATH=/usr/share/go
export PATH=${GOROOT}/bin:${GOPATH}/bin:$PATH

bash .tools/convert-markdown-into-ipynb-and-test.sh

#01.fit_a_line
jupyter nbconvert --to python book/01.fit_a_line/README.ipynb --stdout | python
jupyter nbconvert --to python book/01.fit_a_line/README.en.ipynb --stdout | python

#02.recognize_digits
jupyter nbconvert --to python book/02.recognize_digits/README.ipynb --stdout | python
jupyter nbconvert --to python book/02.recognize_digits/README.en.ipynb --stdout | python
