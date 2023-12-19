FROM ubuntu:latest

RUN apt update && apt upgrade -y
RUN apt install -y curl wget iputils-ping net-tools inetutils-traceroute

RUN wget https://github.com/aquaproj/aqua/releases/download/v2.21.0/aqua_linux_amd64.tar.gz && \
    tar -xvf aqua_linux_amd64.tar.gz && \
    mv aqua /usr/local/bin && \
    rm -rf aqua_linux_amd64.tar.gz
COPY aqua.yaml aqua.yaml
RUN aqua i
ENV PATH="/root/.local/share/aquaproj-aqua/bin:${PATH}"

CMD ["bash"]
