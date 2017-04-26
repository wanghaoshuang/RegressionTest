# Regression Test

## v2

Currently, PaddlePaddle Book consists of eight chapters, and each one represents an irreplaceable topic.
Any time you modify an implementation within PaddlePaddle Book, regression testing is supposed to be
triggered automatically.

```bash
/bin/bash ./v2/run_regtest.sh 1 book_image_name book_image_tag
```

> `1` denotes regression testing for `01.fit_a_line`.

> `book_image_name` is a docker image name of PaddlePaddle Book.

> `book_image_tag` is an image tag of that.


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
