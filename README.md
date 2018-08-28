# alpine-panstamp
multiarch alpine image with PanStamp Lagarto SWAP.

# Run Command
docker run \
        --name panstamp -d -p 8010:8010 \
        -v /opt/panstamp:/opt/python_tools/lagarto/lagarto-swap/config \
        --device=/dev/ttyS0 \
        --restart=always \
        boomalien/alpine-panstamp
