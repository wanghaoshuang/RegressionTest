#!/bin/bash
set -xe

cur_path="$(cd "$(dirname "$0")" && pwd -P)"

#paddle book image name
if [ ! -n "$2" ]; then
  book_image=paddlepaddle/book
else
  book_image=$2
fi

#paddle book image tag
if [ ! -n "$3" ]; then
  book_tag=latest
else
  book_tag=$3
fi

#regression test
docker run -i --rm -v "/Users/liaogang/Google Drive/github/book:/book" -v "${cur_path}:/reg_test" ${book_image}:${book_tag} /bin/bash -c "/bin/bash /reg_test/demo.sh $1"
