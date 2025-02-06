ARG OS_NAME
ARG OS_VERSION

FROM ${OS_NAME}:${OS_VERSION}

ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

ENV ROOTSYS=/usr/local
ENV PATH=$ROOTSYS/bin:${PATH:-}
ENV PYTHONPATH=$ROOTSYS/lib:${PYTHONPATH:-}
ENV CLING_STANDARD_PCH=none

WORKDIR /opt

ARG OS_NAME
ARG OS_VERSION
ARG PACKAGE_NAME
ARG PACKAGE_VERSION
ARG PLATFORM_ARCH

COPY Dockerfile.packages /opt/Dockerfile.packages
RUN apt-get update -qq \
    && ln -sf /usr/share/zoneinfo/UTC /etc/localtime \
    && apt-get -y install $(cat /opt/Dockerfile.packages) \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/root-project/root.git root \
    && cd root && git checkout v$(echo "$PACKAGE_VERSION" | sed 's/\./-/g') \
    && mkdir /opt/root-build && cd /opt/root-build \
    && cmake /opt/root && make -j$(nproc) && make install \
    && rm -rf /opt/root /opt/root-build

# Set default command to run ROOT
CMD ["root", "-b"]

