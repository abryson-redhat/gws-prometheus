FROM registry.access.redhat.com/ubi8

EXPOSE 9090

USER root

RUN mkdir /prometheus && \
    cd /prometheus && \
    yum install -y wget && \
    wget https://github.com/prometheus/prometheus/releases/download/v2.26.0/prometheus-2.26.0.linux-amd64.tar.gz && \
    tar xvf prometheus-2.26.0.linux-amd64.tar.gz && \
    mv ./prometheus-2.26.0.linux-amd64/* . && \
    rmdir ./prometheus-2.26.0.linux-amd64 && \
    rm -f prometheus-2.26.0.linux-amd64.tar.gz && \
    chmod -R go+rwx /prometheus

WORKDIR /prometheus
     
USER 1001

ENTRYPOINT ["./prometheus"]
