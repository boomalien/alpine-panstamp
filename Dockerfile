ARG arch=amd64

FROM boomalien/alpine-python2:${arch}-1.0.8
LABEL maintainer="Oliver Mazur"
LABEL Description="Panstamp Lagarto SWAP multi arch image. This Image uses alpine as base image"

ARG USER_ID=1000
ARG GROUP_ID=1000
RUN addgroup -g ${GROUP_ID} panstamp \
 && adduser -D panstamp -u ${USER_ID} -g panstamp -G panstamp -s /bin/sh -h /



COPY tmp/qemu-arm-static /usr/bin/qemu-arm-static
COPY tmp/qemu-aarch64-static /usr/bin/qemu-aarch64-static
#COPY requirements.txt ./

RUN pip install paho-mqtt && \
    pip install pyserial && \
    pip install CherryPy==17.3.0 && \
    pip install pycrypto

WORKDIR /opt
RUN git clone https://github.com/panStamp/python_tools.git

WORKDIR python_tools/pyswap
RUN python /opt/python_tools/pyswap/setup.py install
RUN chown -R panstamp:panstamp /opt/python_tools
EXPOSE 8001

CMD ["python","/opt/python_tools/lagarto/lagarto-swap/lagarto-swap.py"]
