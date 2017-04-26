# Regression Test

## v2

Currently, PaddlePaddle Book consists of eight chapters, and each one represents an irreplaceable topic.
Any time you modify an implementation within PaddlePaddle Book, regression testing is supposed to be
triggered automatically.

To 
```bash
/bin/bash ./v2/run_regtest.sh 1 book_image_name book_image_tag
```

> `1` denotes regression testing for `01.fit_a_line`.
> `book_image_name` is a docker image name of PaddlePaddle Book.
> `book_image_tag` is an image tag of that.


| Regression Test          |  Status              |
| ------------------------ |:--------------------:|
| 01.fit_a_line            | CPU: - [x]           |
| 02.recognize_digits      | CPU: - [x]           |
| 03.image_classification  | CPU: - [x]           |
| 05.understand_sentiment  | |
| 06.label_semantic_roles  | |
| 07.machine_translation   | |
| 08.recommender_system    | |
