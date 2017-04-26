#!/bin/bash
set -xe

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: bash run_regtest.sh <demo:[1-8]> <use gpu:[0/1] <book_image:option> <book_tag:option>"
    exit
fi

demo_num=$1
use_gpu=$2

#paddle book image name
if [ ! -n "$3" ]; then
  book_image=paddlepaddle/book
else
  book_image=$3
fi

#paddle book image tag
if [ ! -n "$4" ]; then
  book_tag=latest
else
  book_tag=$4
fi

#regression test
cur_path="$(cd "$(dirname "$0")" && pwd -P)"

if [ "0" = ${use_gpu}]; then
  docker run -i --rm -v "${cur_path}:/reg_test" ${book_image}:${book_tag} /bin/bash -c "/bin/bash /reg_test/demo.sh ${demo_num} ${use_gpu}"
else
  nvidia-docker run -i --rm -v "${cur_path}:/reg_test" ${book_image}:${book_tag} /bin/bash -c "/bin/bash /reg_test/demo.sh ${demo_num} ${use_gpu}"
fi