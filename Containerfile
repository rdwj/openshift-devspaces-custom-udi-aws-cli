FROM registry.redhat.io/devspaces/udi-rhel8:3.4

ENV JBANG_VERSION=0.102.0
ENV SKUPPER_VERSION=1.2.2

USER root

# Install skupper
RUN wget https://github.com/skupperproject/skupper/releases/download/${SKUPPER_VERSION}/skupper-cli-${SKUPPER_VERSION}-linux-amd64.tgz \
    -O - | tar -xz -C /usr/local/bin/

# Install JBang
RUN wget https://github.com/jbangdev/jbang/releases/download/v${JBANG_VERSION}/jbang.tar \
    -O - | tar -x --strip 2 -C /usr/local/bin jbang/bin/jbang

RUN for f in "/home/user" "/projects"; do \
      chgrp -R 0 ${f} && \
      chmod -R g=u ${f}; \
    done

USER 1000

WORKDIR /projects
CMD tail -f /dev/null

