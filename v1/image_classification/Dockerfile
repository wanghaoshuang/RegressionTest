FROM registry.baidu.com/yuyang18/paddle:latest_cpu_avx
ENV http_proxy http://192.168.198.155:8890
ENV https_proxy http://192.168.198.155:8890
RUN apt-get update && apt-get install -y git wget
RUN cd / && git clone https://github.com/PaddlePaddle/Paddle.git &&     cd Paddle && git checkout release/0.10.0
COPY run.sh /
COPY test.patch /
RUN cd /Paddle && patch -p0 </test.patch
CMD /run.sh
