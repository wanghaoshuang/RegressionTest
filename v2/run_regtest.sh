#!/bin/bash
set -e

#paddle book image name
if [ ! -n "$1" ]; then
  book_image=paddlepaddle/book
else
  book_image=$1
fi

#paddle book image tag
if [ ! -n "$2" ]; then
  book_tag=latest
else
  book_tag=$2
fi

#regression test
docker run -i --rm -p 8888:8888 -v "$PWD:/reg_test" ${book_image}:${book_tag} /bin/bash /reg_test/demo.sh
