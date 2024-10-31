FROM ubuntu:latest as download
ARG VERSION

RUN wget -O /tmp/factorio.tar.xz https://factorio.com/get-download/${VERSION}/headless/linux64
RUN tar -xvf /tmp/factorio.tar.xz -C /opt

FROM ubuntu:latest as runtime
COPY --from=download /opt/factorio /opt/factorio

RUN /opt/factorio/bin/x64/factorio \
    --start-server-load-latest \
    --server-settings /opt/factorio/data/server-settings.json