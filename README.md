# alpine-panstamp
[![Build status](https://ci.appveyor.com/api/projects/status/bhma7tmx0eje73ao/branch/master?svg=true)](https://ci.appveyor.com/project/boomalien/alpine-panstamp/branch/master)
[![This image on DockerHub](https://img.shields.io/docker/pulls/boomalien/alpine-panstamp.svg)](https://hub.docker.com/r/boomalien/alpine-panstamp/)


multiarch alpine image with PanStamp Lagarto SWAP.
The container is able to run without root privileges. It uses su-exec to run the application as a user. To run the application as a user we need to pass the following three environment variables:
-e USER_ID=<USER ID>
-e GROUP_ID=<GROUP ID> 

# Run Command

#create local directories \
mkdir -p /smartHome/panstamp \
        
docker run \
        --name panstamp \
        --restart=always \
        --device /dev/ttyS1 \ 
        --publish 8010:8010 \
        --mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \ 
        --mount type=bind,src=/etc/timezone,dst=/etc/timezone,readonly \
        --mount type=bind,src=/smartHome/panstamp,dst=/opt/python_tools/lagarto/lagarto-swap/config \
        -e USER_ID=999 \
        -e GROUP_ID=1000 \
        -e CHOWN_DIRS=/opt/python_tools/pyswap \
        panstamp
