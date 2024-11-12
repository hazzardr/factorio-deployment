FROM ubuntu:latest as download
ARG VERSION

RUN apt-get update && apt-get install -y wget xz-utils
RUN wget -O /tmp/factorio.tar.xz https://factorio.com/get-download/${VERSION}/headless/linux64
RUN tar -xvf /tmp/factorio.tar.xz -C /opt

FROM ubuntu:latest as runtime
COPY --from=download /opt/factorio /opt/factorio
