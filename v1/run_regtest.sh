#!/bin/bash
set -e
CMD_NAME=$0
FROM_IMG=$1

function prompt(){
	echo "${CMD_NAME} FROM_IMG DIRNAME [PROXY]"
	exit 1
}


if [[ -z ${FROM_IMG} ]]; then
	prompt
fi

DIRNAME=$2

if [[ -z ${DIRNAME} ]]; then
	prompt
fi

PROXY=$3

cat > ${DIRNAME}/Dockerfile <<EOF
FROM ${FROM_IMG}
EOF

if [[ -n ${PROXY} ]]; then
	cat >> ${DIRNAME}/Dockerfile <<EOF
ENV http_proxy ${PROXY}
ENV https_proxy ${PROXY}
EOF
fi

cat >> ${DIRNAME}/Dockerfile <<EOF
RUN apt-get update && apt-get install -y git wget
RUN cd / && git clone https://github.com/PaddlePaddle/Paddle.git && \
    cd Paddle && git checkout release/0.10.0
COPY run.sh /
COPY test.patch /
RUN cd /Paddle && patch -p0 /test.patch
CMD /run.sh
EOF

cd ${DIRNAME}
docker build -t paddle_regtest_${DIRNAME} .
docker run -it --rm paddle_regtest_${DIRNAME}
docker rmi paddle_regtest_${DIRNAME}
