# alpine-panstamp
[![Build status](https://ci.appveyor.com/api/projects/status/bhma7tmx0eje73ao/branch/master?svg=true)](https://ci.appveyor.com/project/boomalien/alpine-panstamp/branch/master)
[![This image on DockerHub](https://img.shields.io/docker/pulls/boomalien/alpine-panstamp.svg)](https://hub.docker.com/r/boomalien/alpine-panstamp/)


multiarch alpine image with PanStamp Lagarto SWAP.

# Run Command

#create local directories \
mkdir -p /smartHome/panstamp \

#run container \
docker run \
        --name panstamp -d -p 8010:8010 \
        -v /smartHome/panstamp:/opt/python_tools/lagarto/lagarto-swap/config \
        --device=/dev/ttyS0 \
        --restart=always \
        boomalien/alpine-panstamp
