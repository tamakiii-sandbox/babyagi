FROM amazonlinux:2023.0.20230322.0

ARG ORGANIZATION="yoheinakajima"
ARG REPOSITORY="babyagi"

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

COPY requirements.txt /usr/local/lib/${ORGANIZATION}/${REPOSITORY}/requirements.txt
COPY Makefile /usr/local/lib/${ORGANIZATION}/${REPOSITORY}/Makefile

RUN make -C /usr/local/lib/${ORGANIZATION}/${REPOSITORY} install
