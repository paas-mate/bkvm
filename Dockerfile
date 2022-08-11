FROM ttbb/base:jdk17

WORKDIR /opt/sh

ENV BKVM_HOME /opt/sh/bkvm

ARG version=3.1.1

RUN wget https://github.com/diennea/bookkeeper-visual-manager/releases/download/v$version/bkvm-$version.zip && \
unzip bkvm-$version.zip && \
mv bkvm-$version bkvm && \
rm -rf bkvm-$version.zip

COPY --chmod=0755 entrypoint.sh /opt/sh/bkvm/entrypoint.sh

WORKDIR /opt/sh/bkvm
ENTRYPOINT [ "/opt/sh/bkvm/entrypoint.sh" ]
CMD ["/usr/bin/dumb-init", "/opt/sh/bkvm/bin/service", "server", "console"]
