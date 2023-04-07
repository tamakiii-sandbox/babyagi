FROM amazonlinux:2023.0.20230322.0

RUN dnf update -y && \
    dnf install -y \
      man \
      make \
      which \
      less \
      python3.11 \
      python3.11-pip \
      && \
    dnf clean all && \
    rm -rf /var/cache/dnf

RUN alternatives --install /usr/local/bin/python python /usr/bin/python3.11 1
RUN alternatives --install /usr/local/bin/pip pip /usr/bin/pip3.11 1
