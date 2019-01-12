ARG arch=amd64

FROM boomalien/alpine-python2:${arch}-1.0.8
LABEL maintainer="Oliver Mazur"
LABEL Description="Panstamp Lagarto SWAP multi arch image. This Image uses alpine as base image"

ENV USER_ID=1000
ENV GROUP_ID=1000

COPY tmp/qemu-arm-static /usr/bin/qemu-arm-static
COPY tmp/qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    su-exec && \
    pip --no-cache-dir install paho-mqtt  \
    pyserial \
    CherryPy==17.3.0 \
    pycrypto

WORKDIR /opt
RUN git clone https://github.com/panStamp/python_tools.git

WORKDIR python_tools/pyswap
RUN python /opt/python_tools/pyswap/setup.py install
EXPOSE 8001

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["python","/opt/python_tools/lagarto/lagarto-swap/lagarto-swap.py"]
