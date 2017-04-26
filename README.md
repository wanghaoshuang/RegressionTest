# Regression Test

## v2

Currently, PaddlePaddle Book consists of eight chapters, and each one represents an irreplaceable topic.
Any time you modify an implementation within PaddlePaddle Book, regression testing is supposed to be
triggered automatically.

```bash
demo_num=1 # demo no.1
use_gpu=1  # use gpu
/bin/bash ./v2/run_regtest.sh ${demo_num} ${use_gpu} book_image_name book_image_tag
```

> `demo_num=1` denotes regression test for `01.fit_a_line`.

> `use_gpu=1` denotes regression test on PaddlePaddle Book with GPU`

> `book_image_name` is a docker image name of PaddlePaddle Book. [default: paddlepaddle/book]

> `book_image_tag` is an image tag of that. [default: latest]


## [PaddlePaddle DashBoard](http://yq01-idl-gpu-jpaas-let01.yq01.baidu.com:8111/overview.html)

| Regression Test          |  Status                           |
| ------------------------ |:---------------------------------:|
| 01.fit_a_line            | CPU: **pass** GPU: **pass**       |
| 02.recognize_digits      | CPU: **pass** GPU: **pass**       |
| 03.image_classification  | CPU: **pass** GPU: **pass**       |
| 04.word2vec              | CPU: **pass** GPU: **pass**       |
| 05.understand_sentiment  | CPU: **pass** GPU: **pass**       |
| 06.label_semantic_roles  | CPU: **pass** GPU: **????**       |
| 07.machine_translation   | CPU: **pass** GPU: **pass**       |
| 08.recommender_system    | CPU: **pass** GPU: **pass**       |
