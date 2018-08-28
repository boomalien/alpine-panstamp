FROM alpine:3.8
LABEL maintainer="Oliver Mazur"
LABEL Description="Panstamp Lagarto SWAP multi arch image. This Image uses alpine as base image"

RUN easy_install paho-mqtt && \
    easy_install pyserial && \
    easy_install cherrypy && \
    easy_install pycrypto

WORKDIR /opt

RUN git clone https://github.com/panStamp/python_tools.git

WORKDIR python_tools/pyswap

RUN python /opt/python_tools/pyswap/setup.py install

EXPOSE 8001

CMD ["python","/opt/python_tools/lagarto/lagarto-swap/lagarto-swap.py"]